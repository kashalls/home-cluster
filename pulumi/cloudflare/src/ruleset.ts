import * as cloudflare from "@pulumi/cloudflare";

export const ok8sh_ruleset = new cloudflare.Ruleset("ok8sh-ruleset", {
  kind: "zone",
  name: "default",
  phase: "http_request_firewall_custom",
  zoneId: "0d25405508f47412a22635be99b37c46",
  rules: [
    {
      action: 'block',
      description: 'Block Countries',
      enabled: true,
      expression: "(ip.geoip.country in {\"CN\" \"IN\" \"KP\" \"RU\"})"
    },
    {
      action: 'block',
      description: 'Block Bots',
      enabled: true,
      expression: "(cf.client.bot) or (cf.threat_score gt 14)"
    },
    {
      action: 'skip',
      actionParameters: {
        ruleset: 'current'
      },
      description: 'Allow Github Access to Flux Webhook',
      enabled: true,
      expression: '(http.host eq \"flux-webhook.ok8.sh\" and ip.geoip.asnum eq 36459)',
      logging: {
        enabled: true
      }
    }
  ]
})
