# Terraform backend configuration

terraform {

  required_version = ">= 0.12"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
    ovirt = {
      source  = "ovirt/ovirt"
      version = "~> 2.1"
    }
    rancher2 = {
      source  = "rancher/rancher2"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
    template = {
      source  = "hashicorp/template"
      version = "~> 2.2"
    }
  }
}

