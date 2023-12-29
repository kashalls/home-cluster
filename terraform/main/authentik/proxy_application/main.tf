terraform {
  required_providers {
    authentik = {
      source  = "goauthentik/authentik"
      version = "2023.10.0"
    }
  }
}

resource "authentik_provider_proxy" "proxy_provider" {
  name                  = var.name
  external_host         = "https://${var.slug}.${var.domain}"
  mode                  = "forward_single"
  authorization_flow    = var.authorization_flow
  access_token_validity = "hours=${var.access_token_validity}"
  skip_path_regex       = var.ignore_paths
}

resource "authentik_application" "proxy_application" {
  name              = var.name
  slug              = var.slug
  group             = var.group
  protocol_provider = authentik_provider_proxy.proxy_provider.id
  meta_description  = var.description
  meta_icon         = var.icon_url
  open_in_new_tab   = var.newtab
}

resource "authentik_policy_binding" "proxy_application" {
  target = authentik_application.proxy_application.uuid
  group  = var.auth_groups[count.index]
  order  = count.index
  count  = length(var.auth_groups)
}
