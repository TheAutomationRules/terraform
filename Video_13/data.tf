data "terraform_remote_state" "workspace-output" {
  count   = local.environment == "default" ? 0 : 1
  backend = "s3"
  config  = {
    bucket = local.backend_bucket_name
    key    = "${local.project}/${local.environment}/${local.tfstatefile}.tfstate"
  }
}

data "terraform_remote_state" "workspace-shared" {
  backend = "s3"
  config  = {
    bucket = local.backend_bucket_name
    key    = "${local.project}/shared/${local.tfstatefile}.tfstate"
  }
}