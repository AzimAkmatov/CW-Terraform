resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "node-3tier-app-dashboard"
  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric",
        x = 0,
        y = 0,
        width = 24,
        height = 6,
        properties = {
          metrics = [
            ["AWS/EC2", "CPUUtilization", "InstanceId", "i-1234567890abcdef0"],
            ["...", "i-1234567890abcdef1"]
          ],
          period = 300,
          stat = "Average",
          region = "us-west-2",
          title = "EC2 CPU Utilization"
        }
      }
    ]
  })
}
