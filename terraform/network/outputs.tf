output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnets" {
  value = aws_subnet.public[*].id
}

output "private_subnets" {
  value = aws_subnet.private[*].id
}

output "web_security_group_id" {
  value = aws_security_group.web_sg.id
}

output "api_security_group_id" {
  value = aws_security_group.api_sg.id
}

output "db_security_group_id" {
  value = aws_security_group.db_sg.id
}
