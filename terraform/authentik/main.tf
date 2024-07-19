terraform {
  cloud {
    hostname     = "app.terraform.io"
    organization = "kashall"
    workspaces {
      name = "authentik"
    }
  }
  required_providers {
    authentik = {
      source = "goauthentik/authentik"
      version = "2024.6.1"
    }
  }
}

module "secret_authentik" {
  # Remember to export OP_CONNECT_HOST and OP_CONNECT_TOKEN
  source = "github.com/bjw-s/terraform-1password-item?ref=main"
  vault  = "Kubernetes"
  item   = "authentik"
}

module "secret_grafana" {
  source = "github.com/bjw-s/terraform-1password-item?ref=main"
  vault  = "Kubernetes"
  item   = "grafana"
}

module "secret_minio" {
  source = "github.com/bjw-s/terraform-1password-item?ref=main"
  vault  = "Kubernetes"
  item   = "minio"
}

module "secret_weave-gitops" {
  source = "github.com/bjw-s/terraform-1password-item?ref=main"
  vault  = "Kubernetes"
  item   = "weave-gitops"
}

provider "authentik" {
  url   = "https://id.ok8.sh"
  token = module.secret_authentik.fields["TERRAFORM_TOKEN"]
}
