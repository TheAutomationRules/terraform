# Terraform module to create AWS S3 Bucket
module "s3" {
  source      = "../modules/mod-aws-s3"
  region      = local.region
  bucket_name = "s3-${local.region}-${local.environment}"
  tags        = {
    Name = "s3-${local.region}-${local.environment}"
  }
}

output "s3_bucket_id" {
  value = module.s3[*].s3_bucket_id
}

output "s3_bucket_arn" {
  value = module.s3[*].s3_bucket_arn
}