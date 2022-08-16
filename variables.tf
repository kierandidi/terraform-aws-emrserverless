variable "application_name" {
  type        = string
  description = "EMR serverless application name"
  default     = "application-emr-serverless"
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
  default     = "10 GB"
  description = "Amount of initial worker memory, directly available at job submission"
}

variable "scripts" {
  type        = list(string)
  default     = null
  description = "Script files to be zipped and uploaded to S3 bucket"
}

variable "scripts_name_in_bucket" {
  type        = string
  default     = null
  description = "Name of compressed zip directory in S3 bucket (e.g. scripts.zip)"
}

variable "job_file" {
  type        = string
  default     = null
  description = "File that will be submitted as job to EMR Serverless application, e.g. job.py"
}