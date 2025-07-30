# This file defines the AWS S3 bucket for storing bus breakdown data.

# It includes the bucket name and configurations for versioning and public access.
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  force_destroy = true
}

# This resource enables versioning for the S3 bucket.
resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = "Enabled"
  }
}

# This resource configures the public access block settings for the S3 bucket.
# It blocks public ACLs, public policies, and restricts public buckets.
# This is important for security to prevent unauthorized access.
resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

