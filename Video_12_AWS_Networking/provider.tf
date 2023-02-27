# ------------------------------------------------------------------------------
# PROVIDERS
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# PROVIDER VAULT

provider "vault" {
  skip_tls_verify = true
  address         = "${local.vault_protocol}://${local.vault_addr}:8200"
  token           = var.vault_root_token
}

# ------------------------------------------------------------------------------
# PROVIDER AWS

provider "aws" {
  region = local.region

  # CREDS FROM > AWS FIXED SUBSCRIPTION
  #access_key = ""
  #secret_key = ""

  # CREDS FROM > AWS SECRET ENGINE
  access_key = data.vault_aws_access_credentials.creds.access_key
  secret_key = data.vault_aws_access_credentials.creds.secret_key

  default_tags {
    tags = local.tags
  }
}