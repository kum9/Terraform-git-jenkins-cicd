output "instance_ids_from_instance" {
  value = [for instance in module.ec2.aws_instance.web : instance.id]
}

output "security_group_id_from_instance" {
  value = module.ec2.aws_security_group.web.id
}
