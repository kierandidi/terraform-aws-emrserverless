# S3 bucket for script storage
resource "aws_s3_bucket" "emr-serverless-bucket" {
  bucket        = var.bucket_name
  force_destroy = true
  tags          = var.bucket_tags
}

# S3 bucket acl
resource "aws_s3_bucket_acl" "emr-serverless-bucket-acl" {
  bucket        = aws_s3_bucket.emr-serverless-bucket.id
  acl           = var.bucket_acl
}
