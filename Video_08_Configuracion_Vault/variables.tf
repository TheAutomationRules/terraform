locals {
  region      = "eu-central-1"
}

#-------------------------------------------------------------------------------
# VAULT DATA
#-------------------------------------------------------------------------------
variable "vault_root_token" {}
variable "vault_addr" {}

#-------------------------------------------------------------------------------
# VAULT MEMBERS
#-------------------------------------------------------------------------------

variable "iac_members" {
  type    = list(string)
  default = [
    "rockemsockem",
    "kevinmitnick",
    "kevinpoulsen",
    "jonathanjames",
    "albertgonzalez",
    "michaelcalce",
    "johndrapper"
  ]
}

#-------------------------------------------------------------------------------
# AWS & SERVICES VARIABLES
#-------------------------------------------------------------------------------

# AWS theautomationrules
variable "aws_account_id_theautomationrules" {}
variable "access_key_theautomationrules" {}
variable "secret_key_theautomationrules" {}

