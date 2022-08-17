variable "application_name" {
  type        = string
  description = "EMR serverless application name"
  #default     = "application-emr-serverless"
}
variable "bucket_name" {
  type        = string
  description = "The bucket in which scripts for the application will be stored"
  default     = "bucket-emr-serverless"
}
variable "application_max_memory" {
  type        = string
  description = "The maximum memory available for the entire application."
  default     = "4 GB"
}
variable "application_max_cores" {
  type        = string
  description = "The maximum CPU cores for the entire application."
  default     = "1 vCPU"
}

variable "initial_worker_count" {
  type        = number
  default     = null
  description = "Number of initial workers, directly available at job submission"
}

variable "initial_worker_cpu" {
  type        = string
  default     = "2 vCPU"
  description = "Amount of initial worker memory, directly available at job submission"
}

variable "initial_worker_memory" {
  type        = string
  description = "Amount of initial worker memory, directly available at job submission"
  default     = "10 GB"
}

variable "scripts" {
  type        = string
  description = "Script folder to be compressed and uploaded to S3 bucket. Pass this parameter a single folder so that the directory structure is maintained."
  #default     = null
}

variable "env" {
  type        = string
  description = "Environment to be compressed and uploaded to S3 bucket (either conda or venv)"
  default     = null
}

variable "use_conda" {
  type        = bool
  description = "Indicate whether conda should be used for environment packaging"
  default     = false
}

variable "use_pip" {
  type        = bool
  description = "Indicate whether pip should be used for environment packaging"
  default     = false
}