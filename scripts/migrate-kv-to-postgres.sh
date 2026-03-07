#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEPLOY_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
REPO_ROOT="$(cd "${DEPLOY_DIR}/.." && pwd)"
ENV_FILE="${DEPLOY_DIR}/env/production.env"
NETWORK_NAME="via-net"

if [[ ! -f "${ENV_FILE}" ]]; then
  echo "Missing ${ENV_FILE}"
  echo "Create it from ${DEPLOY_DIR}/env/production.env.example first."
  exit 1
fi

if ! docker network inspect "${NETWORK_NAME}" >/dev/null 2>&1; then
  echo "Docker network ${NETWORK_NAME} not found."
  echo "Deploy the shared stack first with ${DEPLOY_DIR}/scripts/deploy.sh."
  exit 1
fi

set -a
source "${ENV_FILE}"
set +a

docker run --rm \
  --network "${NETWORK_NAME}" \
  -v "${REPO_ROOT}/via-backend:/src" \
  -w /src \
  -e NATS_URL="${VIA_NATS_URL:-nats://via-nats:4222}" \
  -e PG_HOST="${PG_HOST:-postgres}" \
  -e PG_PORT="${PG_PORT:-5432}" \
  -e PG_USER="${PG_USER:-via}" \
  -e PG_PASSWORD="${PG_PASSWORD:-via-dev-password}" \
  -e PG_DATABASE="${PG_DATABASE:-via}" \
  -e PG_SSLMODE="${PG_SSLMODE:-disable}" \
  -e PG_MAX_CONNS="${PG_MAX_CONNS:-20}" \
  -e PG_MIN_CONNS="${PG_MIN_CONNS:-2}" \
  -e PG_MAX_CONN_LIFETIME="${PG_MAX_CONN_LIFETIME:-30m}" \
  -e PG_MAX_CONN_IDLE_TIME="${PG_MAX_CONN_IDLE_TIME:-5m}" \
  golang:1.24-alpine \
  sh -c 'go run ./cmd/migrate-kv-to-postgres'
