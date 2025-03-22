resource "aws_instance" "web" {
  ami           = var.ami_id        # Reference the valid AMI ID
  count         = 2                 # Create 2 instances
  instance_type = var.instance_type # Directly set the instance type

  vpc_security_group_ids = [aws_security_group.web.id] # Use security group ID instead of name

  root_block_device {
    volume_size           = var.volume_size           # Set the volume size
    volume_type           = var.volume_type           # General Purpose SSD
    delete_on_termination = var.delete_on_termination # Ensure volume deletion on termination
  }

  tags = {
    Name = "HelloWorld"
  }
}
