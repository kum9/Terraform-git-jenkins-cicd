output "public_ip" {
  value       = aws_instance.web.public_ip
  description = "The public IP address of the instance"
}

output "instance_id" {
  value       = aws_instance.web.id
  description = "The ID of the instance"
}

output "security_group_id" {
  value       = aws_security_group.web.id
  description = "The ID of the security group"
}


