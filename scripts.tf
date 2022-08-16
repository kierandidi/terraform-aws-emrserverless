locals {
  scripts_source = "${path.module}/${var.scripts_name_in_bucket}"
  job_file_source = "${path.module}/${var.job_file}"
}

resource "aws_s3_object" "scripts_upload" {
  bucket      = var.bucket_name
  key         = var.scripts_name_in_bucket
  source      = local.scripts_source
  etag = filemd5(local.object_source)
}

resource "aws_s3_object" "job_file_upload" {
  bucket      = var.bucket_name
  key         = var.job_file
  source      = local.job_file_source
  etag = filemd5(local.object_source)
}