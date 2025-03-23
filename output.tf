output "instance_ids" {
  value = module.ec2.instance_ids  # Correct reference
}

output "public_ips" {
  value = module.ec2.public_ips  # Correct reference
}

output "security_group_id" {
  value = module.sg.security_group_id  # Correct reference
}
