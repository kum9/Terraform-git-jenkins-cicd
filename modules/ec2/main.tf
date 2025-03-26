resource "aws_instance" "web" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.web.name]

  count = 2

  root_block_device {
    volume_size           = var.volume_size
    volume_type           = var.volume_type
    delete_on_termination = var.delete_on_termination
  }

  tags = {
    Name = "HelloWorld-${count.index}" # Unique name for each instance (e.g., HelloWorld-0, HelloWorld-1)
  }
}
