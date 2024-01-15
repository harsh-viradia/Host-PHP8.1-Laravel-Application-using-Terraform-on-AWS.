resource "aws_cloudwatch_log_group" "application-redis-cloudwatch-log-group" {
  name = var.cloudwatch-log-name
}