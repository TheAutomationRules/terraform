locals {
  # [Irland: eu-west-1, Spain: eu-south-2 | Frankfurt: eu-central-1]
  region         = "eu-central-1"
  environment    = "testing"
  creator        = "Terraform"
  team           = "IAC"
  entity         = "theautomationrules"
  vault_addr     = "nomad1"
  vault_protocol = "http" # [ HTTP | HTTPS ]
  aws_account    = "vault_nuc"

  tags = {
    Environment = local.environment
    Creator     = local.creator
    Team        = local.team
    Entity      = local.entity
  }

  pub_subnets_cidr ={
    "${local.region}a" = "172.31.10.0/24"
    "${local.region}b" = "172.31.11.0/24"
    "${local.region}c" = "172.31.12.0/24"
  }
}

#-------------------------------------------------------------------------------
# VAULT DATA
#-------------------------------------------------------------------------------
variable "vault_root_token" {
  description = "Default Root Token to login in Vault instance"
}

# ------------------------------------------------------------------------------
# VPC
# ------------------------------------------------------------------------------

variable "vpc_cidr_block" {
  description = "CIDR IP Block to be assigned in VPC"
  default     = "172.31.0.0/16"
}

variable "routing_table_cird_block" {
  description = "CIDR IP Block to be assigned in Routing Table"
  default     = "0.0.0.0/0"
}


// LAS DOS SIGUIENTES VARIABLES REALMENTE NO SON NECESARIAS
// UTILIZAMOS LA VARIABLE LOCAL pub_subnets_cidr
// DONDE YA TENEMOS DEFINIDAS TANTO LA KEY COMO EL
// VALUE

/*
variable "public_subnet_cidr_blocks" {
  description = "Subnet string list for ForEach Loop."
  type    = list(string)
  default = ["172.31.10.0/24", "172.31.11.0/24", "172.31.12.0/24"]
}

variable "region_zones" {
  description = "Subnet region zones to be assigned"
  type    = list(string)
  default = ["a", "b", "c"]
}*/
