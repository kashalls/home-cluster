module "oauth2-grafana" {
  source             = "./oauth2_application"
  name               = "Grafana"
  icon_url           = "https://raw.githubusercontent.com/grafana/grafana/main/public/img/icons/mono/grafana.svg"
  launch_url         = "https://grafana.ok8.sh"
  description        = "Infrastructure Graphs"
  newtab             = true
  group              = "Infrastructure"
  auth_groups        = [authentik_group.infrastructure.id]
  authorization_flow = resource.authentik_flow.provider-authorization-implicit-consent.uuid
  client_id          = module.secret_grafana.fields["OIDC_CLIENT_ID"]
  client_secret      = module.secret_grafana.fields["OIDC_CLIENT_SECRET"]
  redirect_uris      = ["https://grafana.ok8.sh/login/generic_oauth"]
}

module "oauth2-minio" {
  source                       = "./oauth2_application"
  name                         = "Minio"
  icon_url                     = "https://www.cloudfoundry.org/wp-content/uploads/2017/01/Minio-logo_1_1_.png"
  launch_url                   = "https://minio.ok8.sh/"
  description                  = "Infrastructure S3 Storage"
  newtab                       = true
  group                        = "Infrastructure"
  auth_groups                  = [authentik_group.infrastructure.id]
  authorization_flow           = resource.authentik_flow.provider-authorization-implicit-consent.uuid
  client_id                    = module.secret_minio.fields["OIDC_CLIENT_ID"]
  client_secret                = module.secret_minio.fields["OIDC_CLIENT_SECRET"]
  additional_property_mappings = formatlist(authentik_scope_mapping.openid-minio.id)
  redirect_uris                = ["https://minio.ok8.sh/oauth_callback"]
}
