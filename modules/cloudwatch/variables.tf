# This file defines the variables used in the CloudWatch module.

# It includes variables for the Lambda function name and the email address for alerts.
variable "lambda_function_name" {
  description = "Name of the Lambda function to monitor"
  type        = string
}

# This variable defines the email address to receive CloudWatch alarm notifications.
variable "alert_email" {
  description = "Email address to receive CloudWatch alarm notifications"
  type        = string
}
