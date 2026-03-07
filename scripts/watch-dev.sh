#!/usr/bin/env bash
# watch-dev.sh – Rebuild and restart via-realtime-gateway whenever
# Go source files change.  Requires fswatch (brew install fswatch).
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEPLOY_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
ROOT_DIR="$(cd "${DEPLOY_DIR}/.." && pwd)"
ENV_FILE="${DEPLOY_DIR}/env/production.env"
COMPOSE_FILE="${DEPLOY_DIR}/docker-compose.production.yml"

# ─── dependency check ──────────────────────────────────────────────────────────
if ! command -v fswatch &>/dev/null; then
  echo "fswatch not found. Install it with:  brew install fswatch"
  exit 1
fi

if ! command -v docker &>/dev/null; then
  echo "docker not found."
  exit 1
fi

# ─── helpers ───────────────────────────────────────────────────────────────────
COMPOSE_CMD=(docker compose)
if [[ -f "${ENV_FILE}" ]]; then
  COMPOSE_CMD+=(--env-file "${ENV_FILE}")
fi
COMPOSE_CMD+=(-f "${COMPOSE_FILE}")

deploy_gateway() {
  echo ""
  echo "──────────────────────────────────────────────────────────────────────"
  echo " $(date '+%H:%M:%S')  Rebuilding via-realtime-gateway …"
  echo "──────────────────────────────────────────────────────────────────────"
  if "${COMPOSE_CMD[@]}" up -d --build --no-deps realtime-gateway; then
    echo " ✓  Gateway redeployed successfully."
  else
    echo " ✗  Build failed — fix errors and save again to retry."
  fi
}

# ─── initial deploy ────────────────────────────────────────────────────────────
echo "Starting full stack …"
"${COMPOSE_CMD[@]}" up -d
echo "Stack is up."

deploy_gateway

# ─── watch loop ────────────────────────────────────────────────────────────────
WATCH_DIR="${ROOT_DIR}/via-backend"
echo ""
echo "Watching  ${WATCH_DIR}  for Go source changes …"
echo "Press Ctrl+C to stop."
echo ""

# --batch-marker prevents multiple rapid saves from triggering multiple builds.
# -e '\\.go$' watches only .go files (mod/sum changes are included only via
# go.mod/go.sum patterns).
fswatch -o \
  --event Created --event Updated --event Renamed --event Removed \
  --recursive \
  --include '\.go$' --include 'go\.(mod|sum)$' \
  --exclude '.*' \
  "${WATCH_DIR}" | while read -r _count; do
    deploy_gateway
  done
