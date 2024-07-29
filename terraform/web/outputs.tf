output "instance_id" {
  value = aws_instance.web.id
}

output "public_dns" {
  value = aws_instance.web.public_dns
}
