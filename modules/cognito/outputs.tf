# This file contains the outputs for the Cognito module.

# It provides the necessary information about the user pool, app client, and hosted UI URL.
output "user_pool_id" {
  value = aws_cognito_user_pool.this.id
}

#  This output provides the ID of the Cognito user pool client, which is used for authentication.
output "app_client_id" {
  value = aws_cognito_user_pool_client.this.id
}

# This output provides the URL for the hosted UI of the Cognito user pool, which is used for user authentication.
output "hosted_ui_url" {
  value = "https://${aws_cognito_user_pool_domain.this.domain}.auth.us-east-1.amazoncognito.com/login?response_type=token&client_id=${aws_cognito_user_pool_client.this.id}&redirect_uri=${var.callback_urls[0]}"
}
