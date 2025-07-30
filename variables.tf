# This file is part of the nycsbus-terraform project.

# It defines the provider configuration for AWS.
variable "region" {}

# This file defines the variables used in the S3 module.
variable "bucket_name" {
  description = "The name of the S3 bucket"
}

variable "s3_bucket_arn" {
  description = "ARN of the S3 bucket to store raw payloads"
  type        = string
}

variable "dynamodb_table_arn" {
  description = "ARN of the DynamoDB table"
  type        = string
}

variable "sns_topic_arn" {
  description = "ARN of the SNS topic for high-priority alerts"
  type        = string
}
