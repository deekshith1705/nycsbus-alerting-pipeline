# This file defines the Cognito user pool and its associated resources.

# It includes the user pool, app client, and domain configuration.
resource "aws_cognito_user_pool" "this" {
  name = var.user_pool_name
}

# This resource creates a Cognito user pool client, which allows applications to interact with the user pool. 
resource "aws_cognito_user_pool_client" "this" {
  name         = var.app_client_name
  user_pool_id = aws_cognito_user_pool.this.id

  generate_secret = false

  allowed_oauth_flows       = ["implicit"]
  allowed_oauth_scopes      = ["email", "openid"]
  supported_identity_providers = ["COGNITO"]

  callback_urls = var.callback_urls
  logout_urls   = var.logout_urls

  allowed_oauth_flows_user_pool_client = true
}

# This resource creates a Cognito user pool domain, which is used for hosting the user pool's authentication UI.
resource "aws_cognito_user_pool_domain" "this" {
  domain       = var.domain_prefix
  user_pool_id = aws_cognito_user_pool.this.id
}
