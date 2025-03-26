output "instance_ids" {
  value = [for instance in aws_instance.web : instance.id]
}

output "public_ips" {
  value = [for instance in aws_instance.web : instance.public_ip]
}

# In modules/sg/outputs.tf
output "security_group_id" {
  value = aws_security_group.web.id
}
