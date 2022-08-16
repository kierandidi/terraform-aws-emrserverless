# AWS EMR Serverless Terraform module

Terraform module which creates EMR Serverless application and all resources, roles and policies needed to use it. Based on [AWS Documentation](https://docs.aws.amazon.com/emr/latest/EMR-Serverless-UserGuide/getting-started.html).

## Usage

```hcl
module "emrserverless" {
  source = "github.com/kierandidi/terraform-aws-emrserverless"

  application_name        = "application-emr-serverless"
  bucket_name             = "bucket-emr-serverless"
  application_max_memory  = "4 GB"
  application_max_cores   = "1 vCPU"
  
  # optional initial configurations 
  initial_woker_count     = 0
  initial_woker_cpu       = "2 vCPU"
  initial_woker_memory    = "10 GB"
}
```

## Outputs

| Name | Description |
|------|-------------|
| <a name="application_id"></a>[application_id](application_id) | ID of the EMR Serverless Application |
| <a name="application_name"></a>[application_name](application_name) | Name of the EMR Serverless Application |
| <a name="execution_role_arn"></a>[execution_role_arn](execution_role_arn) | Execution role ARN of the EMR Serverless Application |

