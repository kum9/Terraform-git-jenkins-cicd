module "sg" {
  source = "./modules/sg"
}

module "ec2" {
  source            = "./modules/ec2"
  security_group_id = module.sg.security_group_id  # Passing the security group ID to the ec2 module

  ami_id                = var.ami_id
  instance_type         = var.instance_type
  volume_size           = var.volume_size
  volume_type           = var.volume_type
  delete_on_termination = var.delete_on_termination
}
