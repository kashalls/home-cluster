import * as cloudflare from "@pulumi/cloudflare";

export const mainZone = new cloudflare.Zone("zone-main", {
  accountId: process.env.CLOUDFLARE_ACCOUNT_TAG,
  plan: "free",
  zone: "ok8.sh",
}, {
  protect: true,
});


