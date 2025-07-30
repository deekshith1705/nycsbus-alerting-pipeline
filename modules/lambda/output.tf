# This file defines the outputs for the Lambda module.

# It provides the necessary information about the Lambda function used for processing bus breakdown data.
output "lambda_function_name" {
  value = aws_lambda_function.this.function_name
}

# This output provides the ARN of the Lambda function.
output "lambda_function_arn" {
  value = aws_lambda_function.this.arn
}
