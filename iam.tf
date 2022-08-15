resource "aws_iam_role" "emr-serverless-role" {
  
    name = "emr-serverless-role"
    permissions_boundary = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/telesys/tt-base-permission-boundary"
    tags = {
        Name = "emr-serverless-role"
    }

    assume_role_policy = jsonencode(
        {
            Version =  "2012-10-17",
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

 output "execution_role_arn" {
        value = aws_iam_role.emr-serverless-role.arn
}

resource "aws_iam_role_policy" "emr-serverless-role" {

    name = "emr-serverless-policy"
    role = aws_iam_role.emr-serverless-role.id

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