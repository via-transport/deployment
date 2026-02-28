#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEPLOY_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
ROOT_DIR="$(cd "${DEPLOY_DIR}/.." && pwd)"
ENV_FILE="${DEPLOY_DIR}/env/production.env"

if [[ -f "${ENV_FILE}" ]]; then
  # shellcheck disable=SC1090
  source "${ENV_FILE}"
fi

IMAGE_REGISTRY="${VIA_IMAGE_REGISTRY:-local}"
IMAGE_TAG="${VIA_IMAGE_TAG:-latest}"
GATEWAY_IMAGE="${IMAGE_REGISTRY}/via-realtime-gateway:${IMAGE_TAG}"

echo "Building ${GATEWAY_IMAGE}"

docker build \
  -f "${DEPLOY_DIR}/docker/gateway.Dockerfile" \
  -t "${GATEWAY_IMAGE}" \
  "${ROOT_DIR}"

echo "Build complete: ${GATEWAY_IMAGE}"
