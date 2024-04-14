import * as cloudflare from "@pulumi/cloudflare";

export const r2_cloudnative_pg_v1 = new cloudflare.R2Bucket("r2-cloudnative-pg-v1", {
    accountId: "3ed51f2c99510cd7fe8fcd8ed0621a37",
    location: "WNAM",
    name: "cloudnative-pg-v1",
}, {
    protect: true,
});

export const r2_volsync_restic = new cloudflare.R2Bucket("r2-volsync-restic", {
  accountId: "3ed51f2c99510cd7fe8fcd8ed0621a37",
  location: "WNAM",
  name: "volsync-restic",
}, {
  protect: true,
});

export const r2_test = new cloudflare.R2Bucket("r2-test", {
  accountId: "3ed51f2c99510cd7fe8fcd8ed0621a37",
  location: "WNAM",
  name: "test-kashall",
});
