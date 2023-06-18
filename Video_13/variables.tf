# ------------------------------------------------------------------------------
# LOCALS AND VARIABLES
# ------------------------------------------------------------------------------
locals {
  region      = "eu-central-1"
  environment = terraform.workspace
  creator     = "Terraform"
  team        = "IAC"
  entity      = "The Automation Rules"

  project             = "project01"
  backend_bucket_name = "tar-tfstate-demo"
  tfstatefile         = "terraform"

  sb_number = ["1"]

  tags = {
    Environment = local.environment
    Creator     = local.creator
    Team        = local.team
    Entity      = local.entity
  }
}