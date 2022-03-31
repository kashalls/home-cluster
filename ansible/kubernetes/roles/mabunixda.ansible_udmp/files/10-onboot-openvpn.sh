#!/usr/bin/env sh

DEBUG=${DEBUG:--d}
CONTAINER_NAME="openvpn"


if podman container exists ${CONTAINER_NAME}; then
  podman start ${CONTAINER_NAME}
else
  podman run --name $CONTAINER_NAME \
           --health-cmd=["pgrep","openvpn"] \
           --network=host \
           -v /dev/net/tun:/dev/net/tun \
           -v /mnt/data/ovpn:/tmp/vpn \
           --privileged \
           --restart=always \
           openvpn \
           ovpn_run /tmp/vpn/vpn_config.vpn
fi
