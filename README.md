# Deployment

This folder is the shared deployment workspace for VIA infrastructure.

It is intentionally separate from the app repos so you can keep ops assets in one place.

## Structure

- `docker-compose.production.yml`: production stack for the current Go realtime gateway + NATS
- `docker-compose.services.example.yml`: example service containers for future backend microservices
- `nats/docker-compose.yml`: NATS-only stack for local or standalone broker deployment
- `docker/gateway.Dockerfile`: production container image for the Go realtime gateway
- `dev/tile-proxy/`: tracked local tile proxy for Android emulator map delivery
- `env/production.env.example`: environment template for production deployments
- `scripts/build-images.sh`: builds the gateway image from the workspace
- `scripts/deploy.sh`: deploys the production stack with Docker Compose
- `scripts/logs.sh`: tails service logs from the production stack
- `scripts/run-tile-proxy.sh`: starts the local map tile proxy used by Android emulators

## Current Production Stack

The production stack in this folder deploys:

- `via-nats`: NATS with JetStream enabled
- `via-realtime-gateway`: the Go gateway from `via-backend`

The Flutter apps do not connect to NATS directly. They connect to the Go gateway over HTTP/WebSocket, and the gateway relays messages through NATS.

## Quick Start

1. Copy the environment template:

```bash
cp deployment/env/production.env.example deployment/env/production.env
```

2. Build the gateway image:

```bash
./deployment/scripts/build-images.sh
```

3. Deploy the stack:

```bash
./deployment/scripts/deploy.sh
```

4. Watch logs:

```bash
./deployment/scripts/logs.sh
```

## Local Dev Utilities

When Android emulators cannot resolve map tile hosts reliably, run the tracked tile
proxy and point the Flutter apps at `10.0.2.2`.

1. Start the proxy:

```bash
./deployment/scripts/run-tile-proxy.sh
```

2. Run the Flutter apps with:

```bash
--dart-define='VIA_TILE_PROXY_URL=http://10.0.2.2:8311/osm/{z}/{x}/{y}.png'
```

The proxy caches tiles locally under `deployment/dev/tile-proxy/cache/`.

## Notes

- `docker-compose.services.example.yml` is intentionally an example file. Replace placeholder image names with your real service images when those services exist.
- If you later split backend services (user, fleet, notifications, billing), extend the example compose file instead of mixing those definitions into the app repos.
- For production, put this folder behind a reverse proxy (Caddy, Nginx, Traefik) and terminate TLS there.
