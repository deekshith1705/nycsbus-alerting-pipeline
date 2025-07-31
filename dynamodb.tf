# This file defines the DynamoDB table for storing bus breakdown data.

# It includes the table name, billing mode, and hash key configuration.
module "dynamodb" {
  source              = "./modules/dynamodb"
  dynamodb_table_name = "bus-breakdowns"
}

