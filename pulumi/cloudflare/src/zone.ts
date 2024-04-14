import * as cloudflare from "@pulumi/cloudflare";

export const ok8sh_zone = new cloudflare.Zone("ok8sh-zone", {
  accountId: "3ed51f2c99510cd7fe8fcd8ed0621a37",
  plan: "free",
  zone: "ok8.sh",
}, {
  protect: true,
});
