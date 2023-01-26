resource "aws_cloudwatch_metric_alarm" "unavailable" {
  alarm_name          = var.alarm_name
  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluation_periods
  period              = var.alarm_unavailable_period
  treat_missing_data  = var.treat_missing_data
}
