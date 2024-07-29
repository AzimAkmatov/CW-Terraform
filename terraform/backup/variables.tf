variable "db_instance_identifier" {
  description = "Identifier of the RDS DB instance to back up"
  type        = string
}

variable "backup_role_arn" {
  description = "ARN of the IAM role for AWS Backup"
  type        = string
}

variable "kms_key_arn" {
  description = "ARN of the KMS key for AWS Backup"
  type        = string
}
