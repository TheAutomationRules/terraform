# ------------------------------------------------------------------------------
# DATA
# ------------------------------------------------------------------------------

# SECRETS FROM CLOUD/KV SECRET ENGINE / VAULT

# AWS SUBSCRIPTION
data "vault_generic_secret" "aws_creds" {
  path = "cloud/aws/${local.entity}/${local.aws_account}"
}

# ACCESS / SECRET KEYS GENERATED FROM VAULT AWS SECRET ENGINE
data "vault_aws_access_credentials" "creds" {
  backend = "aws/${local.entity}"
  role = "aws-iam-credentials-${local.entity}"
  type = "creds"
}