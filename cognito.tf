# This file defines the Cognito user pool and app client for user authentication.

# It includes the user pool name, app client name, domain prefix, and callback/logout URLs.
module "cognito" {
  source          = "./modules/cognito"
  user_pool_name  = "nycsbus-user-pool"
  app_client_name = "nycsbus-app-client"
  domain_prefix   = "bus-events1"
  callback_urls   = ["https://d84l1y8p4kdic.cloudfront.net"]
  logout_urls     = ["https://d84l1y8p4kdic.cloudfront.net"]
}


