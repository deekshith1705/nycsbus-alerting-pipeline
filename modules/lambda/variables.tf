# This file defines the variables for the Lambda module.

variable "function_name" {}
variable "s3_bucket" {}
variable "s3_key" {}
variable "handler" {}
variable "runtime" {}
variable "role_arn" {}


# This variable defines the environment variables for the Lambda function.
variable "environment_variables" {
  type    = map(string)
  default = {}
}

