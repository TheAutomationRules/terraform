output "s3_bucket_id" {
  value = [aws_s3_bucket.s3-bucket[*].id]
}
output "s3_bucket_arn" {
  value = [aws_s3_bucket.s3-bucket[*].arn]
}