resource "aws_iam_role" "EMRServerlessS3RuntimeRole" {

  name = "${var.application_name}-role"
  tags = {
    Name = "${var.application_name}-role"
  }

  assume_role_policy = jsonencode(
    {
      Version = "2012-10-17",
      Statement = [
        {
          Action = "sts:AssumeRole"
          Principal = {
            Service = "emr-serverless.amazonaws.com"
          }
          Effect = "Allow"
        }
      ]
    }
  )
}

resource "aws_iam_role_policy" "EMRServerlessS3AccessPolicy" {

  name = "emr-serverless-policy"
  role = aws_iam_role.EMRServerlessS3RuntimeRole.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {

        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ],
        Resource = [
          "arn:aws:s3:::*.elasticmapreduce",
          "arn:aws:s3:::*.elasticmapreduce/*"
        ]
      },
      {
        Effect = "Allow"
        Action = [
          "s3:*"
        ]
        Resource = [
          aws_s3_bucket.emr-serverless-bucket.arn,
          "${aws_s3_bucket.emr-serverless-bucket.arn}/*"
        ]
      }
    ]
  })
}