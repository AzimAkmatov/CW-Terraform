variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "subnets" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "security_groups" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "db_name" {
  description = "Database name"
  default     = "mydb"
}

variable "db_user" {
  description = "Database user"
  default     = "admin"
}

variable "db_password" {
  description = "Database password"
  default     = "password"
}
