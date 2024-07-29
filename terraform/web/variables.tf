variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "subnets" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "key_name" {
  description = "The name of the key pair to use for the instances"
  type        = string
}
