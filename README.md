# Deployment

This folder is the shared deployment workspace for VIA infrastructure.

It is intentionally separate from the app repos so you can keep ops assets in one place.

## Structure

- `docker-compose.production.yml`: production stack for the current Go realtime gateway + NATS
- `docker-compose.services.example.yml`: example service containers for future backend microservices
- `nats/docker-compose.yml`: NATS-only stack for local or standalone broker deployment
- `docker/gateway.Dockerfile`: production container image for the Go realtime gateway
- `env/production.env.example`: environment template for production deployments
- `scripts/build-images.sh`: builds the gateway image from the workspace
- `scripts/deploy.sh`: deploys the production stack with Docker Compose
- `scripts/logs.sh`: tails service logs from the production stack

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

## Notes

- `docker-compose.services.example.yml` is intentionally an example file. Replace placeholder image names with your real service images when those services exist.
- If you later split backend services (user, fleet, notifications, billing), extend the example compose file instead of mixing those definitions into the app repos.
- For production, put this folder behind a reverse proxy (Caddy, Nginx, Traefik) and terminate TLS there.
