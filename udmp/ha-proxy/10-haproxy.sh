#!/bin/sh
CONTAINER=haproxy

# Starts a cloudflare ddns container that is deleted after it is stopped.
# All configs stored in /mnt/data/cloudflare-ddns
if podman container exists "$CONTAINER"; then
  podman start "$CONTAINER"
else
podman run -d --network haproxy --restart always \
  --name "$CONTAINER" \
  --hostname ha.proxy \
  -v "/mnt/data/haproxy/:/usr/local/etc/haproxy/" \
  docker.io/library/haproxy:latest