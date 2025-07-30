# This file defines the AWS Lambda function for processing bus breakdown data.

# It includes the function name, S3 bucket, S3 key, handler, runtime, and role ARN.
resource "aws_lambda_function" "this" {
  function_name = var.function_name
  s3_bucket     = var.s3_bucket
  s3_key        = var.s3_key
  handler       = var.handler
  runtime       = var.runtime
  role          = var.role_arn
  
# This resource creates a Lambda function with the specified environment variables.
  environment {
    #variables = var.environment_variables
    variables = {
      S3_BUCKET              = "bus-breakdowns-raw-nycsbus"
      DYNAMO_TABLE           = "bus-breakdowns"
      COGNITO_USER_POOL_ID   = "us-east-1_uYCW8zlx2"
      COGNITO_APP_CLIENT_ID  = "33csskgur8qc50u7vaeki2vqv6"
    }
  }
}