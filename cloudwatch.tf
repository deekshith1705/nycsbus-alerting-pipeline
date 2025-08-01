# This file defines the CloudWatch module for monitoring and alerting.

# It includes the configuration for CloudWatch alarms and notifications.
module "cloudwatch" {
  source               = "./modules/cloudwatch"
  alert_email          = "nampalsh@mail.uc.edu" # ✅ replace with your email
  lambda_function_name = module.lambda.lambda_function_name
}
