# This file defines the DynamoDB table for storing bus breakdown data.

# It includes the table name, billing mode, and hash key configuration.
resource "aws_dynamodb_table" "this" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "Busbreakdown_ID"
# This resource creates a DynamoDB table with the specified attributes.
  attribute {
    name = "Busbreakdown_ID"
    type = "N"
  }
}
