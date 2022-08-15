# AWS EMR Serverless Terraform module

Terraform module which creates EMR Serverless application and all resources, roles and policies needed to use it. Based on [AWS Documentation](https://docs.aws.amazon.com/emr/latest/EMR-Serverless-UserGuide/getting-started.html).

## Usage

```hcl
module "emrserverless" {
  source = "github.com/kierandidi/terraform-aws-emrserverless"

  application_name = "application-emr-serverless"
  bucket_name = "bucket-emr-serverless"
  application_max_memory = "4 GB"
  application_max_cores = "1 vCPU"

}
```
