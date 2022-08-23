##########################
# Application parameters
##########################

output "application_id" {
  value       = aws_emrserverless_application.emr_application.id
  description = "Id of the EMR Serverless application, can be used to submit/view jobs from AWS CLI"
}

output "application_name" {
  value       = aws_emrserverless_application.emr_application.name
  description = "Name of the EMR Serverless application, can be used to submit/view jobs from AWS Console"
}

output "execution_role_arn" {
  value       = aws_iam_role.EMRServerlessS3RuntimeRole.arn
  description = "ARN of execution role, can be used to attach role for other purposes"
}

##########################
# Storage parameters
##########################

output "bucket_name" {
  value       = aws_s3_bucket.emr-serverless-bucket.bucket
  description = "Scripts bucket"
}

output "scripts_path" {
  value = data.external.archive_prepare[0].result.filename
  description = "Path to the compressed zip file in the S3 bucket"
}
