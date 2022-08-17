

locals {
  scripts_source = var.scripts == null ? null : "${path.module}/${var.scripts}"
  env_source     = var.env == null ? null : "${path.module}/${var.env}" 
}


resource "aws_s3_object" "scripts_upload" {
  count = var.scripts == null ? 0 : 1
  provisioner "local-exec" {
    command = "zip -r ${var.scripts}.zip ${local.scripts_source}"
  }

  bucket = var.bucket_name
  key    = var.scripts
  source = "${local.scripts_source}.zip"
  etag   = filemd5(local.scripts_source)
}

resource "aws_s3_object" "env_conda_upload" {
  count = var.use_conda == null ? 0 : 1
  #provisioner "local-exec" {
  #  command = conda cmd
  #}

  bucket = var.bucket_name
  key    = var.env
  source = local.env_source
  etag   = filemd5(local.env_source)
}

resource "aws_s3_object" "env_pip_upload" {
  count = var.use_pip ? 0 : 1
  #provisioner "local-exec" {
  #  command = pip cmd
  #}

  bucket = var.bucket_name
  key    = var.env
  source = local.env_source
  etag   = filemd5(local.env_source)
}