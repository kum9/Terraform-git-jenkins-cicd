# Access outputs from the ec2 module
output "ec2_security_group_id" {
  value = module.ec2.security_group_id
}

output "ec2_instance_ids" {
  value = module.ec2.instance_ids
}

output "ec2_public_ips" {
  value = module.ec2.public_ips
}