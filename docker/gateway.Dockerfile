FROM golang:1.23-alpine AS builder

WORKDIR /src

COPY via-backend/go.mod via-backend/go.sum ./via-backend/

WORKDIR /src/via-backend
RUN go mod download

COPY via-backend/ ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
    go build -trimpath -ldflags="-s -w" -o /out/via-realtime-gateway ./cmd/gateway

FROM gcr.io/distroless/static-debian12:nonroot

WORKDIR /app

COPY --from=builder /out/via-realtime-gateway /app/via-realtime-gateway

EXPOSE 9090

ENV LISTEN_ADDR=:9090

ENTRYPOINT ["/app/via-realtime-gateway"]
