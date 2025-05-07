---
apiVersion: v1
kind: Namespace
metadata:
  name: external-secrets
  labels:
    kustomize.toolkit.fluxcd.io/prune: disabled
---
apiVersion: v1
kind: Secret
metadata:
  name: onepassword-secret
  namespace: external-secrets
stringData:
  1password-credentials.json: op://Kubernetes/1password/OP_CONNECT_JSON
  token: op://Kubernetes/1password/OP_CONNECT_TOKEN
---
apiVersion: v1
kind: Secret
metadata:
  name: cloudflare-tunnel-id-secret
  namespace: network
stringData:
  CLOUDFLARE_TUNNEL_ID: op://Kubernetes/cloudflare/CLOUDFLARE_TUNNEL_ID
