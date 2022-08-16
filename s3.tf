# S3 bucket for script storage
resource "aws_s3_bucket" "emr-serverless-bucket" {

  bucket        = var.bucket_name
  force_destroy = true

  tags = {
    Name = var.bucket_name
  }
}