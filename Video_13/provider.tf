# ------------------------------------------------------------------------------
# PROVIDERS
# ------------------------------------------------------------------------------
provider "aws" {
  region = local.region
  #access_key = ""
  #secret_key = ""
  default_tags {
    tags = local.tags
  }
}