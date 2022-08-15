resource "aws_iam_role" "EMRServerlessS3RuntimeRole" {
  name = "EMRServerlessS3RuntimeRole"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "emr-serverless.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })

}

resource "aws_iam_role_policy" "EMRServerlessS3AndGlueAccessPolicy" {
  name = "EMRServerlessS3AndGlueAccessPolicy"
  role = aws_iam_role.EMRServerlessS3RuntimeRole.id

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "ReadAccessForEMRSamples",
        "Effect" : "Allow",
        "Action" : [
          "s3:GetObject",
          "s3:ListBucket"
        ],
        "Resource" : [
          "arn:aws:s3:::*.elasticmapreduce",
          "arn:aws:s3:::*.elasticmapreduce/*"
        ]
      },
      {
        "Sid" : "FullAccessToOutputBucket",
        "Effect" : "Allow",
        "Action" : [
          "s3:PutObject",
          "s3:GetObject",
          "s3:ListBucket",
          "s3:DeleteObject"
        ],
        "Resource" : [
          "arn:aws:s3:::emr-script-bucket",
          "arn:aws:s3:::emr-script-bucket/*"
        ]
      },
      {
        "Sid" : "GlueCreateAndReadDataCatalog",
        "Effect" : "Allow",
        "Action" : [
          "glue:GetDatabase",
          "glue:CreateDatabase",
          "glue:GetDataBases",
          "glue:CreateTable",
          "glue:GetTable",
          "glue:UpdateTable",
          "glue:DeleteTable",
          "glue:GetTables",
          "glue:GetPartition",
          "glue:GetPartitions",
          "glue:CreatePartition",
          "glue:BatchCreatePartition",
          "glue:GetUserDefinedFunctions"
        ],
        "Resource" : ["*"]
      }
    ]
  })
}