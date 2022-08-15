output "application_id" {
        value = aws_emrserverless_application.emr_application.id
        description = "Id of the EMR Serverless application, can be used to submit/view jobs from AWS CLI"
    }

 output "execution_role_arn" {
        value = aws_iam_role.emr-serverless-role.arn
        description = "ARN of execution role, can be used to attach role for other purposes"
}