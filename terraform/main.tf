provider "aws" {
  region = var.region
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b"]
}

variable "key_name" {
  description = "The name of the key pair to use for the instances"
  type        = string
  default     = "toptal"
}

module "network" {
  source = "./network"
  vpc_cidr = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones = var.availability_zones
}

module "web" {
  source = "./web"
  vpc_id = module.network.vpc_id
  subnets = module.network.public_subnets
  key_name = var.key_name
}

module "api" {
  source = "./api"
  vpc_id = module.network.vpc_id
  subnets = module.network.public_subnets
  db_name = var.db_name
  db_user = var.db_user
  db_password = var.db_password
  db_host = module.db.db_endpoint
  db_port = module.db.db_port
  key_name = var.key_name
}

module "db" {
  source = "./db"
  vpc_id = module.network.vpc_id
  subnets = module.network.private_subnets
  security_groups = [module.network.db_security_group_id]
  db_name = var.db_name
  db_user = var.db_user
  db_password = var.db_password
}

module "autoscaling" {
  source = "./autoscaling"
  web_security_group_id = module.network.web_security_group_id
  api_security_group_id = module.network.api_security_group_id
  subnets = module.network.public_subnets
  db_name = var.db_name
  db_user = var.db_user
  db_password = var.db_password
  db_host = module.db.db_endpoint
  db_port = module.db.db_port
  key_name = var.key_name
}

module "backup" {
  source = "./backup"
  db_instance_identifier = module.db.db_identifier
  region = var.region
  backup_role_arn = aws_iam_role.backup_role.arn
  kms_key_arn = aws_kms_key.backup_key.arn
}

module "logging" {
  source = "./logging"
  web_log_group_name = var.web_log_group_name
  api_log_group_name = var.api_log_group_name
  log_retention_in_days = var.log_retention_in_days
}

module "cloudwatch" {
  source = "./cloudwatch"
  region = var.region
}

module "cdn" {
  source = "./cdn"
  region = var.region
  web_instance_id = module.web.instance_id
  api_instance_id = module.api.instance_id
}

resource "aws_iam_role" "backup_role" {
  name = "backup_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "backup.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "backup_role_policy" {
  role = aws_iam_role.backup_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
}

resource "aws_kms_key" "backup_key" {
  description = "KMS key for backups"
  deletion_window_in_days = 30
}

resource "aws_kms_alias" "backup_alias" {
  name = "alias/backup-key"
  target_key_id = aws_kms_key.backup_key.id
}
