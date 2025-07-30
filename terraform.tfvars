# This file is part of the nycsbus-terraform project.

# It defines the provider configuration for AWS.
region             = "us-east-1" # or whichever region you're using 
dynamodb_table_arn = "arn:aws:dynamodb:us-east-1:440744230312:table/bus-breakdowns1"
bucket_name        = "nycsbus-breakdowns-21c7be88"
sns_topic_arn      = "arn:aws:sns:us-east-1:440744230312:nycsbus-alerts-topic"
s3_bucket_arn      = "arn:aws:s3:::nycsbus-breakdowns-21c7be88"

