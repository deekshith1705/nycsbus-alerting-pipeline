# This file is part of the nycsbus-terraform project.
# It defines the provider configuration for AWS.
provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = "nycsbus-terraform-state"
    key            = "alerting-pipeline/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
