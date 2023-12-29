resource "authentik_group" "users" {
  name         = "users"
  is_superuser = false
}

resource "authentik_group" "media" {
  name         = "media"
  is_superuser = false
  parent       = resource.authentik_group.users.id
}

resource "authentik_group" "infrastructure" {
  name         = "infrastructure"
  is_superuser = false
}

data "authentik_group" "admins" {
  name = "authentik Admins"
}

data "authentik_group" "s3-admin" {
  name = "S3 Superuser"
}
