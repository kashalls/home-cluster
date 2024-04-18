resource "cloudflare_ruleset" "main" {
  kind    = "zone"
  name    = "default"
  phase   = "http_request_firewall_custom"
  zone_id = data.cloudflare_zone.domain.id
  rules {
    action      = "block"
    description = "Block Countries"
    enabled     = true
    expression  = "(ip.geoip.country in {\"CN\" \"IN\" \"KP\" \"RU\"})"
  }
  rules {
    action      = "block"
    description = "Block Bots"
    enabled     = true
    expression  = "(cf.client.bot) or (cf.threat_score gt 14)"
  }
  rules {
    action = "skip"
    action_parameters {
      ruleset = "current"
    }
    description = "Allow github flux api"
    enabled     = true
    expression  = "(http.host eq \"flux-webhook.ok8.sh\" and ip.geoip.asnum eq 36459)"
    logging {
      enabled = true
    }
  }
}
