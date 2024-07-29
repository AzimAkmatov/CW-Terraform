output "web_log_group_name" {
  value = aws_cloudwatch_log_group.web_log.name
}

output "api_log_group_name" {
  value = aws_cloudwatch_log_group.api_log.name
}
