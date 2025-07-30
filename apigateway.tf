# This file defines the API Gateway configuration for the bus event processor.

# It includes the Lambda function ARN, resource path, HTTP method, and AWS region.
module "apigateway" {
  source              = "./modules/apigateway"
  lambda_function_arn = module.lambda.lambda_function_arn
  region              = "us-east-1" # or var.region if declared globally
  resource_path       = "busEventProcessorv2"
  http_method         = "POST"
}
