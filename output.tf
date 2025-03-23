output "instance_ids" {
  value = module.ec2.instance_ids  # Correct reference from the ec2 module
}

output "public_ips" {
  value = module.ec2.public_ips  # Correct reference from the ec2 module
}

output "security_group_id" {
  value = module.sg.security_group_id  # Correct reference from the sg module
}

output "public_ips_from_instance" {
  value = [for instance in aws_instance.web : instance.public_ip]  # Get public IPs from the web instances
}

output "instance_ids_from_instance" {
  value = [for instance in aws_instance.web : instance.id]  # Get instance IDs from the web instances
}

output "security_group_id_from_instance" {
  value = aws_security_group.web.id  # Reference the security group created within the web module
}
