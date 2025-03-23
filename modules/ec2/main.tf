resource "aws_instance" "web" {
  count         = 2  # Number of instances
  ami           = var.ami_id
  instance_type = var.instance_type

  # ✅ Use "vpc_security_group_ids" instead of "security_groups"
  vpc_security_group_ids = [var.security_group_id]  

  root_block_device {
    volume_size           = var.volume_size
    volume_type           = var.volume_type
    delete_on_termination = var.delete_on_termination
  }

  tags = {
    Name = "web-${count.index + 1}"
  }
}

