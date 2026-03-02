#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROXY_SCRIPT="$ROOT_DIR/dev/tile-proxy/tile_proxy.py"

exec python3 "$PROXY_SCRIPT"
