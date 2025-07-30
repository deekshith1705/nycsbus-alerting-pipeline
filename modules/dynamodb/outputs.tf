# This file defines the outputs for the DynamoDB module.

# It provides the necessary information about the DynamoDB table used for storing bus breakdown data.
output "dynamodb_table_name" {
  value = aws_dynamodb_table.this.name
}
