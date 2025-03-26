output "security_group_id" {
  value = var.security_group_id  # Output the security group ID passed from the root module
}

output "instance_ids" {
  value = [for instance in aws_instance.web : instance.id]
}

output "public_ips" {
  value = [for instance in aws_instance.web : instance.public_ip]
}
