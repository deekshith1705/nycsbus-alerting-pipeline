# This file defines the Lambda function configuration for processing bus events.

# It includes the function name, S3 bucket for code, handler, runtime, role ARN, and environment variables.
module "lambda" {
  source        = "./modules/lambda"
  function_name = "busEventProcessorv2"
  s3_bucket     = "nycsbus-breakdowns-12725220"
  s3_key        = "lambda_code.zip"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.13"
  role_arn      = "arn:aws:iam::440744230312:role/service-role/busEventProcessor-role-jtjhgiv4"

  # This resource creates a Lambda function with the specified environment variables.
  environment_variables = {
    S3_BUCKET             = "bus-breakdowns-raw-nycsbus"
    DYNAMO_TABLE          = module.dynamodb.dynamodb_table_name
    COGNITO_USER_POOL_ID  = "us-east-1_uYCW8zlx2"
    COGNITO_APP_CLIENT_ID = "33csskgur8qc50u7vaeki2vqv6"
  }
}
