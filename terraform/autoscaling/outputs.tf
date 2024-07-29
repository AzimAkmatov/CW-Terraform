output "web_asg_id" {
  value = aws_autoscaling_group.web_asg.id
}

output "api_asg_id" {
  value = aws_autoscaling_group.api_asg.id
}
