variable "web_instance_id" {
  description = "ID of the web instance"
  type        = string
}

variable "api_instance_id" {
  description = "ID of the API instance"
  type        = string
}

variable "region" {
  description = "The AWS region to deploy the resources"
  default     = "us-west-2"
}
