FROM caddy:builder-alpine AS builder

RUN xcaddy build \
  --with github.com/andybroger/caddy-webdav \
  --with github.com/caddy-dns/cloudflare

FROM caddy:alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy