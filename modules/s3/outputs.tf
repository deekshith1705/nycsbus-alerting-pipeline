# This file defines the outputs for the S3 module.

# It provides the necessary information about the S3 bucket used for storing bus breakdown data.
output "bucket_name" {
  value = aws_s3_bucket.this.bucket
}

# This output provides the ARN of the S3 bucket.
output "bucket_arn" {
  value = aws_s3_bucket.this.arn
}

