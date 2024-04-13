import * as pulumi from "@pulumi/pulumi";
import * as cloudflare from "@pulumi/cloudflare";

const r2_cloudnative_pg_v1 = new cloudflare.R2Bucket("r2-cloudnative-pg-v1", {
    accountId: process.env.CLOUDFLARE_ACCOUNT_TAG,
    location: "WNAM",
    name: "cloudnative-pg-v1",
}, {
    protect: true,
});


const r2_volsync_restic = new cloudflare.R2Bucket("r2-volsync-restic", {
  accountId: process.env.CLOUDFLARE_ACCOUNT_TAG,
  location: "WNAM",
  name: "volsync-restic",
}, {
  protect: true,
});
