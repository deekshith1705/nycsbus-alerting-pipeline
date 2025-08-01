# This file defines the DynamoDB table for storing bus breakdown data.

# It includes the table name, billing mode, and hash key configuration.
resource "aws_dynamodb_table" "this" {
  name         = "bus-breakdowns"
  billing_mode = "PAY_PER_REQUEST"
  hash_key       = "Route_Number"
  range_key      = "Occurred_On"
  
# This resource creates a DynamoDB table with the specified attributes.
  attribute {
    name = "Route_Number"
    type = "S"
  }
  attribute {
    name = "Occurred_On"
    type = "S"
  }
}

