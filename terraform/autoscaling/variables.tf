variable "web_security_group_id" {
  description = "Security group ID for the web tier"
  type        = string
}

variable "api_security_group_id" {
  description = "Security group ID for the API tier"
  type        = string
}

variable "subnets" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_user" {
  description = "Database user"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
}

variable "db_host" {
  description = "Database host"
  type        = string
}

variable "db_port" {
  description = "Database port"
  type        = number
}

variable "key_name" {
  description = "The name of the key pair to use for the instances"
  type        = string
}
