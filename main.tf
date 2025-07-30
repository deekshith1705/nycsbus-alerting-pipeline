# This file is part of the nycsbus-terraform project.

# It defines the S3 bucket configuration for storing bus breakdown data.
resource "random_id" "suffix" {
  byte_length = 4
}

# This module creates an S3 bucket with the specified name and configurations.
# It includes versioning and public access block settings for security.
module "s3" {
  source      = "./modules/s3"
  bucket_name = "nycsbus-breakdowns-${random_id.suffix.hex}"
}

