# Backend Remote Terraform State Configuration
# bucket: S3 Bucket ID
# key: file or directory/file path to save ej: testdir/terraform.tfstate
# dynamodb_table: Table in AWS DynamoDB created with "LockID" Main Key
# To force unlock the state excecute follow command:
# terraform init -backend-config.yaml="access_key=<ID>" -backend-config.yaml="secret_key=<ID>"
terraform {
  backend "s3" {
    bucket         = "tfstate-tar-testing"
    dynamodb_table = "state-lock-tfstate-tar"
    key            = "environments/testing/aws-s3-bucket.tfstate"
    region         = "eu-central-1"
  }
}