# Tile Proxy

This utility is for local Android emulator development only.

It proxies OpenStreetMap tiles through the host machine so the emulator can use
`10.0.2.2` even when the emulator itself has unreliable DNS resolution.

## Run

```bash
./deployment/scripts/run-tile-proxy.sh
```

Health check:

```bash
curl http://127.0.0.1:8311/healthz
```

## Flutter Usage

Launch the Flutter apps with:

```bash
--dart-define='VIA_TILE_PROXY_URL=http://10.0.2.2:8311/osm/{z}/{x}/{y}.png'
```

## Cache

Tiles are cached under `deployment/dev/tile-proxy/cache/`.
