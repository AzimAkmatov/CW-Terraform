data "aws_caller_identity" "current" {}

variable "region" {
  description = "The AWS region to deploy the resources"
  default     = "us-west-2"
}
