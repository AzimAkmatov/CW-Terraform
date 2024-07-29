variable "web_log_group_name" {
  description = "Name of the CloudWatch log group for the web tier"
  default     = "/aws/web"
}

variable "api_log_group_name" {
  description = "Name of the CloudWatch log group for the API tier"
  default     = "/aws/api"
}

variable "log_retention_in_days" {
  description = "Number of days to retain logs in CloudWatch"
  default     = 30
}
