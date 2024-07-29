variable "region" {
  description = "The AWS region to deploy the resources"
  default     = "us-west-2"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

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

variable "db_host" {
  description = "Database host"
  default     = "db-instance-endpoint"
}

variable "db_port" {
  description = "Database port"
  default     = 3306
}
