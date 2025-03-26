# In modules/ec2/main.tf
resource "aws_instance" "web" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  security_groups = [var.security_group_id]  # Using the passed security group ID

  count = 2

  root_block_device {
    volume_size           = var.volume_size
    volume_type           = var.volume_type
    delete_on_termination = var.delete_on_termination
  }

  tags = {
    Name = "HelloWorld-${count.index}"
  }
}
