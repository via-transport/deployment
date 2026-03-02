#!/usr/bin/env python3
"""Local proxy for OpenStreetMap tiles so Android emulators can use 10.0.2.2."""

from __future__ import annotations

import hashlib
import os
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
from urllib.error import HTTPError, URLError
from urllib.request import Request, urlopen


HOST = os.environ.get("VIA_TILE_PROXY_HOST", "127.0.0.1")
PORT = int(os.environ.get("VIA_TILE_PROXY_PORT", "8311"))
UPSTREAM_TEMPLATE = os.environ.get(
    "VIA_TILE_UPSTREAM_TEMPLATE",
    "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
)
DEFAULT_CACHE_DIR = Path(__file__).resolve().parent / "cache"
CACHE_DIR = Path(os.environ.get("VIA_TILE_CACHE_DIR", str(DEFAULT_CACHE_DIR)))


class TileProxyHandler(BaseHTTPRequestHandler):
    server_version = "ViaTileProxy/1.0"

    def do_GET(self) -> None:
        if self.path == "/healthz":
            self._send_health()
            return

        parts = self.path.strip("/").split("/")
        if len(parts) != 4 or parts[0] != "osm" or not parts[3].endswith(".png"):
            self.send_error(404, "Not found")
            return

        z, x, y_name = parts[1:]
        y = y_name[:-4]
        if not (z.isdigit() and x.isdigit() and y.isdigit()):
            self.send_error(400, "Invalid tile path")
            return

        tile_url = UPSTREAM_TEMPLATE.format(z=z, x=x, y=y)
        cache_key = hashlib.sha1(tile_url.encode("utf-8")).hexdigest()
        cache_path = CACHE_DIR / f"{cache_key}.png"
        CACHE_DIR.mkdir(parents=True, exist_ok=True)

        if cache_path.exists():
            self._send_png(cache_path.read_bytes(), from_cache=True)
            return

        try:
            request = Request(
                tile_url,
                headers={
                    "User-Agent": "VIA-Transport-DevTileProxy/1.0 (+local)",
                    "Accept": "image/png",
                },
            )
            with urlopen(request, timeout=15) as response:
                payload = response.read()
        except HTTPError as error:
            self.send_error(error.code, error.reason)
            return
        except URLError as error:
            self.send_error(502, f"Upstream lookup failed: {error.reason}")
            return

        cache_path.write_bytes(payload)
        self._send_png(payload, from_cache=False)

    def log_message(self, fmt: str, *args: object) -> None:
        return

    def _send_health(self) -> None:
        body = b'{"status":"ok"}'
        self.send_response(200)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)

    def _send_png(self, payload: bytes, *, from_cache: bool) -> None:
        self.send_response(200)
        self.send_header("Content-Type", "image/png")
        self.send_header("Content-Length", str(len(payload)))
        self.send_header("Cache-Control", "public, max-age=86400")
        self.send_header("X-Via-Tile-Cache", "HIT" if from_cache else "MISS")
        self.end_headers()
        self.wfile.write(payload)


def main() -> None:
    server = ThreadingHTTPServer((HOST, PORT), TileProxyHandler)
    print(f"listening on http://{HOST}:{PORT}", flush=True)
    server.serve_forever()


if __name__ == "__main__":
    main()
