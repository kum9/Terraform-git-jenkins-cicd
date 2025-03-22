output "public_ip" {
  value = aws_instance.web[count.index].public_ip
}

output "instance_id" {
  value = aws_instance.web[count.index].id
}

output "security_group_id" {
  value       = aws_security_group.web.id
  description = "The ID of the security group"
}


