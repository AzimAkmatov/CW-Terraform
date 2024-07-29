output "backup_vault_arn" {
  value = aws_backup_vault.db_vault.arn
}

output "backup_plan_id" {
  value = aws_backup_plan.db_backup_plan.id
}
