#------------------
# PROVIDERS
#------------------
provider "aws" {
  region     = local.region
  #access_key = var.aws_access_key
  #secret_key = var.aws_secret_key
  default_tags {
    tags = local.tags
  }
}