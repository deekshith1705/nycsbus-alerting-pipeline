# This file contains the variables for the Cognito module.

# It defines the user pool name, app client name, callback URLs, logout URLs, and domain prefix.
variable "user_pool_name" {}
variable "app_client_name" {}

# This variable defines the callback URLs for the Cognito user pool.
# It is a list of URLs that the user will be redirected to after authentication.
variable "callback_urls" {
  type = list(string)
}
variable "logout_urls" {
  type = list(string)
}
variable "domain_prefix" {}
