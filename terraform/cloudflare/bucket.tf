resource "cloudflare_r2_bucket" "cloudnative-pg-v1" {
    account_id  = "3ed51f2c99510cd7fe8fcd8ed0621a37"
    location = "WNAM"
    name = "cloudnative-pg-v1"
}

resource "cloudflare_r2_bucket" "volsync-restic" {
    account_id  = "3ed51f2c99510cd7fe8fcd8ed0621a37"
    location = "WNAM"
    name = "volsync-restic"
}

