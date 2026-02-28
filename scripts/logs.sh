#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEPLOY_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
ENV_FILE="${DEPLOY_DIR}/env/production.env"
COMPOSE_FILE="${DEPLOY_DIR}/docker-compose.production.yml"

if [[ -f "${ENV_FILE}" ]]; then
  docker compose \
    --env-file "${ENV_FILE}" \
    -f "${COMPOSE_FILE}" \
    logs -f "${@}"
else
  docker compose \
    -f "${COMPOSE_FILE}" \
    logs -f "${@}"
fi
