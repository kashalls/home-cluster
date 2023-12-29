data "authentik_certificate_key_pair" "generated" {
  name = "authentik Self-signed Certificate"
}

resource "authentik_tenant" "home" {
  domain           = "ok8.sh"
  default          = true
  branding_title   = "Home"
  branding_logo    = "https://static.ok8.sh/branding/Banner2-white.svg"
  branding_favicon = "https://static.ok8.sh/branding/favicon.png"

  flow_authentication = authentik_flow.authentication.uuid
  flow_invalidation   = authentik_flow.invalidation.uuid
  flow_user_settings  = authentik_flow.user-settings.uuid
  event_retention     = "days=365"
}

resource "authentik_service_connection_kubernetes" "local" {
  name  = "local"
  local = true
}

resource "authentik_outpost" "proxyoutpost" {
  name               = "proxy-outpost"
  type               = "proxy"
  service_connection = authentik_service_connection_kubernetes.local.id
  protocol_providers = []
  config = jsonencode({
    authentik_host          = "https://id.ok8.sh",
    authentik_host_insecure = false,
    authentik_host_browser  = "",
    log_level               = "debug",
    object_naming_template  = "ak-outpost-%(name)s",
    docker_network          = null,
    docker_map_ports        = true,
    docker_labels           = null,
    container_image         = null,
    kubernetes_replicas     = 1,
    kubernetes_namespace    = "security",
    kubernetes_ingress_annotations = {
      "cert-manager.io/cluster-issuer" = "letsencrypt-production"
    },
    kubernetes_ingress_secret_name = "proxy-outpost-tls",
    kubernetes_service_type        = "ClusterIP",
    kubernetes_disabled_components = [],
    kubernetes_image_pull_secrets  = []
  })
}
