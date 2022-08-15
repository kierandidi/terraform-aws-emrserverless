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