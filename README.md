# AWS EMR Serverless Terraform module

Terraform module which creates EMR Serverless application and all resources, roles and policies needed to use it. Based on [AWS Documentation](https://docs.aws.amazon.com/emr/latest/EMR-Serverless-UserGuide/getting-started.html). For a detailed description of the usage including a cloud architecture diagram see the [blog post](https://kdidi.netlify.app/projects/terraform-module/).

## Usage

```hcl
module "emrserverless" {
  source  = "kierandidi/emrserverless/aws"
  version = "1.0.0"
  
  # application configuration
  application_name        = "application-emr-serverless"
  application_max_memory  = "4 GB"
  application_max_cores   = "1 vCPU"

  # scripts configuration
  bucket_name             = "bucket-emr-serverless"
  bucket_acl              = "bucket-emr-serverless"
  scripts                 = "./my-program"
  
  # optional initial configurations 
  initial_woker_count     = 0
  initial_woker_cpu       = "2 vCPU"
  initial_woker_memory    = "10 GB"
}
```

## Inputs

Usage notes
* Leave the `initial_*` configs empty to avoid idle time costs.
* Before uploading environment, compress it with [conda-pack](https://conda.github.io/conda-pack/) for conda environments and [venv-pack](https://docs.aws.amazon.com/emr/latest/EMR-Serverless-UserGuide/using-python-libraries.html) for venv environments. The compressed environemnt should be in same folder as the terraform file. 

### Application Inputs

Input the following variables to setup the EMR-Serverless application on AWS.

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| <a name="application_name"></a>[application_name](#) | EMR serverless application name. | `string` |  `N/A` | yes |
| <a name="application_max_memory"></a>[application_max_memory](#) | The maximum memory available for the entire application. | `string` |  `4 GB` | no |
| <a name="application_max_cores"></a>[application_max_cores](#) | The maximum CPU cores for the entire application. | `string` |  `1 vCPU` | no |
| <a name="initial_worker_count"></a>[initial_worker_count](#) | Number of initial workers, directly available at job submission. | `number` |  `null` | no |
| <a name="initial_worker_cpu"></a>[initial_worker_cpu](#) | Amount of initial worker memory, directly available at job submission. | `string` |  `2 vCPU` | no |
| <a name="initial_worker_memory"></a>[initial_worker_memory](#) | Amount of initial worker memory, directly available at job submission. | `string` |  `10 GB` | no |

### Storage Inputs for User Scripts

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| <a name="bucket_name"></a>[bucket_name](#) | The bucket in which scripts for the application will be stored. | `string` |  `emr-serverless-bucket` | no |
| <a name="bucket_acl"></a>[bucket_acl](#) | The canned ACL to apply. Valid values are private, public-read, public-read-write, aws-exec-read, authenticated-read, bucket-owner-read, and bucket-owner-full-control. Defaults to private. | `string` |  `private` | no |
| <a name="bucket_tags"></a>[bucket_tags](#) | S3 bucket tags. | `map` |  `{}` | no |
| <a name="scripts"></a>[scripts](#) | Script folder to be compressed and uploaded to S3 bucket. | `string` |  `N/A` | yes |

### Inputs for User Scripts Packaging

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| <a name="artifacts_dir"></a>[artifacts_dir](#) | Directory name where artifacts should be stored. | `string` |  `builds` | no |
| <a name="env"></a>[env](#) | Compressed environment to be uploaded to S3 bucket (either conda or venv). | `string` |  N/A | no |


## Outputs

| Name | Description |
|------|-------------|
| <a name="application_id"></a>[application_id](#) | ID of the EMR Serverless Application |
| <a name="application_name"></a>[application_name](#) | Name of the EMR Serverless Application |
| <a name="execution_role_arn"></a>[execution_role_arn](#) | Execution role ARN of the EMR Serverless Application |
| <a name="bucket_name"></a>[bucket_name](#) | Scripts bucket |

## Authors

Module managed by [Kieran Didi](https://github.com/kierandidi/) and [Anuradha Wickramarachchi](https://github.com/anuradhawick). Check out [serverless.tf](https://serverless.tf) to learn more about doing serverless with Terraform.
