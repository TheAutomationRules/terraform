#------------------
# LOCALS AND VARIABLES
#------------------
locals {
  region = "eu-central-1"
  environment = "testing"
  creator = "Terraform"
  team = "IAC"
  entity = "The Automation Rules"

  tags = {
    Environment = local.environment
    Creator = local.creator
    Team = local.team
    Entity = local.entity
  }
}