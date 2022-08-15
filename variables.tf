variable "application_name" {
    description = "EMR serverless application name"
    default = "application-emr-serverless"
}
variable "bucket_name" { 
    description = "The bucket in which scripts for the application will be stored"
    default = "bucket-emr-serverless"
}
variable "application_max_memory" {
    description = "The maximum memory available for the entire application."
    default = "4 GB"
}
variable "application_max_cores" {
    description = "The maximum CPU cores for the entire application."
    default = "1 vCPU"
}