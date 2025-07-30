# This file is part of the nycsbus-terraform project.
# It defines the outputs for various AWS resources created in the project.
output "s3_bucket_name" {
  value = module.s3.bucket_name
}
output "api_invoke_url" {
  value = module.apigateway.invoke_url
}

output "lambda_function_arn" {
  value = module.lambda.lambda_function_arn
}

output "dynamodb_table_name" {
  value = module.dynamodb.dynamodb_table_name
}

output "cognito_user_pool_id" {
  value = module.cognito.user_pool_id
}

output "cognito_app_client_id" {
  value = module.cognito.app_client_id
}

output "cognito_login_url" {
  value = module.cognito.hosted_ui_url
}
output "cloudwatch_alarm_name" {
  value = module.cloudwatch.cloudwatch_alarm_name
}

output "cloudwatch_sns_topic_arn" {
  value = module.cloudwatch.sns_topic_arn
}
output "lambda_bucket_name" {
  value = module.s3.bucket_name
}
