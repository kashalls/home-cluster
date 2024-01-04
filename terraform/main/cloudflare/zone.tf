resource "cloudflare_zone_settings_override" "domain_settings" {
  zone_id = data.cloudflare_zone.domain.id
  settings {
    always_online             = "off"
    always_use_https          = "on"
    automatic_https_rewrites  = "on"
    brotli                    = "on"
    browser_cache_ttl         = 14400
    browser_check             = "on"
    cache_level               = "aggressive"
    challenge_ttl             = 1800
    cname_flattening          = "flatten_at_root"
    development_mode          = "off"
    early_hints               = "off"
    email_obfuscation         = "on"
    filter_logs_to_cloudflare = "off"
    hotlink_protection        = "off"
    # http2                     = "on" #
    http3                     = "on"
    ip_geolocation            = "on"
    ipv6                      = "on"
    log_to_cloudflare         = "on"
    max_upload                = 100
    min_tls_version           = "1.2"
    minify {
      css  = "on"
      html = "on"
      js   = "on"
    }
    mirage                      = "off"
    opportunistic_encryption    = "on"
    opportunistic_onion         = "on"
    orange_to_orange            = "off"
    origin_error_page_pass_thru = "off"
    polish                      = "off"
    prefetch_preload            = "off"
    privacy_pass                = "on"
    proxy_read_timeout          = "100"
    pseudo_ipv4                 = "off"
    response_buffering          = "off"
    rocket_loader               = "off"
    security_header {
      enabled            = false
      include_subdomains = false
      max_age            = 0
      nosniff            = false
      preload            = false
    }
    security_level              = "medium"
    server_side_exclude         = "on"
    sort_query_string_for_cache = "off"
    ssl                         = "flexible"
    tls_1_3                     = "on"
    tls_client_auth             = "off"
    true_client_ip_header       = "off"
    visitor_ip                  = "on"
    waf                         = "off"
    webp                        = "off"
    websockets                  = "on"
    zero_rtt                    = "off"
  }
}

