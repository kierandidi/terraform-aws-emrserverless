##########################
# Application settings
##########################

variable "application_name" {
  type        = string
  description = "EMR serverless application name."
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
  description = "Number of initial workers, directly available at job submission."
}

variable "initial_worker_cpu" {
  type        = string
  default     = "2 vCPU"
  description = "Amount of initial worker memory, directly available at job submission."
}

variable "initial_worker_memory" {
  type        = string
  description = "Amount of initial worker memory, directly available at job submission."
  default     = "10 GB"
}

##########################
# Script storage settings
##########################

variable "bucket_name" {
  type        = string
  description = "The bucket in which scripts for the application will be stored."
  default     = "emr-serverless-bucket"
}

variable "bucket_acl" {
  type        = string
  description = "The canned ACL to apply. Valid values are private, public-read, public-read-write, aws-exec-read, authenticated-read, bucket-owner-read, and bucket-owner-full-control. Defaults to private."
  default     = "private"
}

variable "bucket_tags" {
  type        = map
  description = "S3 bucket tags."
  default     = {}
}

variable "scripts" {
  type        = string
  description = "Script folder to be compressed and uploaded to S3 bucket."
}

##########################
# Packaging settings
##########################

variable "artifacts_dir" {
  type        = string
  description = "Directory name where artifacts should be stored."
  default     = "builds"
}

variable "env" {
  type        = string
  description = "Environment to be compressed and uploaded to S3 bucket (either conda or venv)."
  default     = null
}

variable "use_conda" {
  type        = bool
  description = "Indicate whether conda should be used for environment packaging."
  default     = false
}

variable "use_pip" {
  type        = bool
  description = "Indicate whether pip should be used for environment packaging."
  default     = false
}