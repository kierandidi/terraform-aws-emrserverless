variable "common-tags" {
  type = map(string)
  description = "A set of tags to attach to every created resource."
  default = {}
}

variable "script-bucket-prefix" {
    type        = string
    description = "S3 bucket for storing scripts used for INSIDER pipeline"
    default     = ""
}

# variable "metadata-bucket-prefix" {
#   type        = string
#   description = "S3 bucket for storing metadata"
#   default     = ""
# }