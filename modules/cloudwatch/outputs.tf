# This file contains the outputs for the CloudWatch module.

# It provides the necessary information about the CloudWatch alarms and SNS topic used for alerts.
output "cloudwatch_alarm_name" {
  value = aws_cloudwatch_metric_alarm.high_priority_alerts.alarm_name
}

# This output provides the ARN of the SNS topic used for alerts.
output "sns_topic_arn" {
  value = aws_sns_topic.alerts.arn
}
