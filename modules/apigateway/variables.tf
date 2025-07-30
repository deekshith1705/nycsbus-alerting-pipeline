# This file defines the variables used in the API Gateway module.
variable "lambda_function_arn" {}
variable "resource_path" {}
variable "http_method" {}


# This variable defines the AWS region where the API Gateway will be deployed.
variable "region" {
  description = "AWS region"
  type        = string
}

