#Provisioning infrastructure for an AWS EMR Serverless application as described here:
#https://docs.aws.amazon.com/emr/latest/EMR-Serverless-UserGuide/getting-started.html


#


module "lambda-submitDataset" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "submitDataset"
  description = "Creates or updates a dataset and triggers INSIDER pipeline."
  handler = "lambda_function.lambda_handler"
  runtime = "python3.9"
  architectures = ["x86_64"]
  memory_size = 128
  timeout = 60
  attach_policy_json = true
  policy_json = data.aws_iam_policy_document.lambda-submitDataset.json
  source_path = "${path.module}/lambda/submitDataset"

  tags = var.common-tags

  environment_variables = {
    DATASETS_TABLE = aws_dynamodb_table.datasets.name
    SUMMARISE_DATASET_SNS_TOPIC_ARN = aws_sns_topic.summariseDataset.arn
    BEACON_API_VERSION = local.api_version
    BEACON_ID = var.beacon-id
  }
  
}

resource "aws_emrserverless_application" "example" {
  name          = "example"
  release_label = "emr-6.6.0"
  type          = "hive"

  initial_capacity {
    initial_capacity_type = "HiveDriver"

    initial_capacity_config {
      worker_count = 1
      worker_configuration {
        cpu    = "2 vCPU"
        memory = "10 GB"
      }
    }
  }

  maximum_capacity {
    cpu    = "2 vCPU"
    memory = "10 GB"
  }
}

