#------------------
# RESOURCE S3
#------------------
resource "aws_s3_bucket" "s3-bucket" {
  bucket = var.bucket_name # IMPORTANT! Conflict with bucket_prefix
  #bucket_prefix = var.bucket_prefix # IMPORTANT! Conflict with bucket
  # TAGs of Resources
  tags = var.tags
}

resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = aws_s3_bucket.s3-bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.s3-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "s3-bucket-acl" {
  bucket = aws_s3_bucket.s3-bucket.id
  block_public_acls   = var.block_public_acls
  block_public_policy = var.block_public_policy
  restrict_public_buckets = true
  ignore_public_acls = true
}