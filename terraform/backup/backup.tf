resource "aws_backup_vault" "db_vault" {
  name        = "db_backup_vault"
  kms_key_arn = var.kms_key_arn
}

resource "aws_backup_plan" "db_backup_plan" {
  name = "db_backup_plan"

  rule {
    rule_name         = "daily-backup"
    target_vault_name = aws_backup_vault.db_vault.name
    schedule          = "cron(0 12 * * ? *)"  # Daily at 12 PM UTC
    lifecycle {
      delete_after = 30  # Retain backups for 30 days
    }
  }
}

resource "aws_backup_selection" "db_backup_selection" {
  iam_role_arn = var.backup_role_arn
  plan_id      = aws_backup_plan.db_backup_plan.id
  name         = "db_backup_selection"

  resources = [
    "arn:aws:rds:${var.region}:${data.aws_caller_identity.current.account_id}:db:${var.db_instance_identifier}"
  ]
}
