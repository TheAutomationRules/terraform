# ------------------------------------------------------------------------------
# TERRAFORM
# ------------------------------------------------------------------------------

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.3.0"
    }
  }

  backend "s3" {
    workspace_key_prefix = "project01"
    bucket               = "tar-tfstate-demo"
    dynamodb_table       = "tar-tfstate-demo"
    key                  = "terraform.tfstate"
    encrypt              = "false"
  }
}