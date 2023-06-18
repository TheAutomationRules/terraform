# ------------------------------------------------------------------------------
# S3 BUCKET MODULE
# ------------------------------------------------------------------------------
module "s3" {
  source      = "../Video_05_Modulos/modules/mod-aws-s3"
  region      = local.region
  bucket_name = "s3-${local.region}-${local.environment}-${local.sb_number[count.index]}"
  count       = length(local.sb_number)

  tags = {
    Name = "s3-${local.region}-${local.environment}-${local.sb_number[count.index]}"
  }
}

output "s3_bucket_id" {
  value = module.s3[*].s3_bucket_id
}

output "s3_bucket_arn" {
  value = module.s3[*].s3_bucket_arn
}
