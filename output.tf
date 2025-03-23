
output "instance_ids" {
  value = module.ec2.instance_ids  # Correct reference
}

output "public_ips" {
  value = module.ec2.public_ips  # Correct reference
}

output "security_group_id" {
  value = module.sg.security_group_id  # Correct reference

output "public_ips" {
  value = [for instance in aws_instance.web : instance.public_ip]
}


output "instance_ids" {
  value = [for instance in aws_instance.web : instance.id]
}



output "security_group_id" {
  value = aws_security_group.web.id
>>>>>>> 9cc7fe86758480718d8a2529d84c016d8da014c8
}
