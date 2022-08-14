# S3 bucket for script storage
#
resource "aws_s3_bucket" "script-bucket" {
  bucket_prefix = emr-script-bucket
  force_destroy = true
  #tags = var.common-tags
}