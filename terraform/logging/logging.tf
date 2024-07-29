resource "aws_cloudwatch_log_group" "web_log" {
  name              = var.web_log_group_name
  retention_in_days = var.log_retention_in_days
}

resource "aws_cloudwatch_log_group" "api_log" {
  name              = var.api_log_group_name
  retention_in_days = var.log_retention_in_days
}
