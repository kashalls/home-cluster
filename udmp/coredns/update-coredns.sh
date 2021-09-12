podman pull ghcr.io/k8s-at-home/coredns:latest
podman stop coredns
podman rm coredns
podman run -d --network coredns --restart always \
  --name coredns \
  --hostname core.dns \
  -v "/mnt/data/coredns/:/config/" \
  k8s-at-home/coredns:latest