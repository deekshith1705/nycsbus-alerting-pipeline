# This Terraform configuration sets up AWS CloudWatch monitoring and alerting for the NYCS Bus application.
resource "aws_sns_topic" "alerts" {
  name = "nycsbus-alerts-topic"
}

# This resource creates an SNS topic for alerts, which will be used to send notifications when certain conditions are met.
resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email
}

# This resource sets up a CloudWatch metric alarm for high priority bus breakdown alerts.
# It monitors a custom metric and triggers if the threshold is exceeded.
resource "aws_cloudwatch_metric_alarm" "high_priority_alerts" {
  alarm_name          = "HighPriorityBusBreakdowns"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "HighPriorityAlerts"
  namespace           = "Custom/NYCSBUS"
  period              = 300
  statistic           = "Sum"
  threshold           = 3
  alarm_description   = "Triggers if 3 or more high priority alerts occur in 5 minutes"
  actions_enabled     = true
  alarm_actions       = [aws_sns_topic.alerts.arn]
}

# This resource sets up a CloudWatch metric alarm for low priority bus breakdown alerts.
# It monitors a custom metric and triggers if the threshold is exceeded.
resource "aws_cloudwatch_metric_alarm" "lambda_errors" {
  alarm_name          = "LambdaExecutionErrors"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "Errors"
  namespace           = "AWS/Lambda"
  period              = 300
  statistic           = "Sum"
  threshold           = 0
  alarm_description   = "Triggers on any Lambda invocation errors"
  actions_enabled     = true
  alarm_actions       = [aws_sns_topic.alerts.arn]

  dimensions = {
    FunctionName = var.lambda_function_name
  }
}
