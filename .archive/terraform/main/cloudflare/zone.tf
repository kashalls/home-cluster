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
    # filter_logs_to_cloudflare = "off" # filter_logs_to_cloudflare cannot be modified for this zone (1057)
    hotlink_protection        = "off"
    # http2                     = "on" # Read-only
    http3                     = "on"
    ip_geolocation            = "on"
    ipv6                      = "on"
    # log_to_cloudflare         = "on" # log_to_cloudflare cannot be modified for this zone (1057)
    max_upload                = 100
    min_tls_version           = "1.2"
    minify {
      css  = "on"
      html = "on"
      js   = "on"
    }
    # mirage                      = "off" # Read-only
    opportunistic_encryption    = "on"
    opportunistic_onion         = "on"
    # orange_to_orange            = "off" # It is not possible to change Orange To Orange settings for this zone. (1024)
    # origin_error_page_pass_thru = "off" # Read-only
    # polish                      = "off" # Read-only
    # prefetch_preload            = "off" # Read-only
    privacy_pass                = "on"
    # proxy_read_timeout          = "100" # Read-only
    pseudo_ipv4                 = "off"
    # response_buffering          = "off" # Read-only
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
    # sort_query_string_for_cache = "off" # Read-only
    ssl                         = "flexible"
    tls_1_3                     = "on"
    tls_client_auth             = "off"
    # true_client_ip_header       = "off" # Read-only
    # visitor_ip                  = "on" # It is not possible to change Visitor IP settings for this zone. (1025)
    # waf                         = "off" # Not allowed to edit setting for waf (1015)
    # webp                        = "off" # Read-only
    websockets                  = "on"
    zero_rtt                    = "off"
  }
}

