output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnets" {
  value = module.network.public_subnets
}

output "private_subnets" {
  value = module.network.private_subnets
}

output "web_log_group_name" {
  value = module.logging.web_log_group_name
}

output "api_log_group_name" {
  value = module.logging.api_log_group_name
}
