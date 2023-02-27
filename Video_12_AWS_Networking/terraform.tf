terraform {
  required_version = ">= 0.12"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "~> 3.3.0"
    }
  }
}