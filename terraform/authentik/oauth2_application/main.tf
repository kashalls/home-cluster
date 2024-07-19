terraform {
  required_providers {
    authentik = {
      source  = "goauthentik/authentik"
      version = "2024.6.1"
    }
  }
}

data "authentik_certificate_key_pair" "generated" {
  name = "authentik Self-signed Certificate"
}

data "authentik_scope_mapping" "scopes" {
  managed_list = [
    "goauthentik.io/providers/oauth2/scope-email",
    "goauthentik.io/providers/oauth2/scope-openid",
    "goauthentik.io/providers/oauth2/scope-profile"
  ]
}

resource "authentik_provider_oauth2" "oauth2-application" {
  name                       = var.name
  client_id                  = var.client_id
  client_secret              = var.client_secret
  authorization_flow         = var.authorization_flow
  signing_key                = data.authentik_certificate_key_pair.generated.id
  client_type                = var.client_type
  include_claims_in_id_token = var.include_claims_in_id_token
  issuer_mode                = var.issuer_mode
  sub_mode                   = var.sub_mode
  access_code_validity       = "hours=${var.access_code_validity}"
  property_mappings          = concat(data.authentik_scope_mapping.scopes.ids, var.additional_property_mappings)
  redirect_uris              = var.redirect_uris
}

resource "authentik_application" "oauth2-application" {
  name              = var.name
  slug              = lower(var.name)
  group             = var.group
  protocol_provider = authentik_provider_oauth2.oauth2-application.id
  meta_icon         = var.icon_url
  meta_description  = var.description
  meta_launch_url   = var.launch_url
  open_in_new_tab   = var.newtab
}

resource "authentik_policy_binding" "oauth2-application" {
  target = authentik_application.oauth2-application.uuid
  group  = var.auth_groups[count.index]
  order  = count.index
  count  = length(var.auth_groups)
}
