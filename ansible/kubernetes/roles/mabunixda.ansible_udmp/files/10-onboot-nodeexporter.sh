#!/usr/bin/env sh

DEBUG=${DEBUG:--d}
CONTAINER_NAME="nodexporter"


if podman container exists ${CONTAINER_NAME}; then
  podman start ${CONTAINER_NAME}
else
  podman run  --name "$CONTAINER_NAME" \
            --network=host \
            --restart always \
            --pid="host" \
            -v "/:/host:ro,rslave" \
            $DEBUG \
            quay.io/prometheus/node-exporter:latest \
            --path.rootfs=/host
fi
