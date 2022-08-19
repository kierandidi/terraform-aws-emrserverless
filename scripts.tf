locals {
  archive_filename        = try(data.external.archive_prepare[0].result.filename, null)
  archive_filename_string = local.archive_filename != null ? local.archive_filename : ""
}

resource "aws_s3_object" "emrserverless_package" {
  count = var.scripts == null ? 0 : 1

  bucket        = var.bucket_name
  key           = replace(local.archive_filename_string, "/^\\.//", "")
  source        = data.external.archive_prepare[0].result.filename

  depends_on    = [null_resource.archive, aws_s3_bucket.emr-serverless-bucket]
}

resource "aws_s3_object" "emrserverless_environment" {
  count = var.env == null ? 0 : 1

  bucket        = var.bucket_name
  key           = var.env
  source        = "${path.cwd}/${var.env}" 

  depends_on    = [aws_s3_bucket.emr-serverless-bucket]
}
