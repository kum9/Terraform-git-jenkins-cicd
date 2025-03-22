resource "aws_instance" "web" {
  ami             = var.ami_id        # Reference the valid AMI ID
  instance_type   = var.instance_type # Directly set the instance type to t2.medium
  security_groups = [aws_security_group.web.name]

  count = 2 # Create 3 instances

  # Define root volume size (30 GB)
  root_block_device {
    volume_size           = var.volume_size           # Set the volume size to 30 GB
    volume_type           = var.volume_type           # General Purpose SSD (can be changed to gp3 or other types)
    delete_on_termination = var.delete_on_termination # Set to true so the volume will be deleted when the instance is terminated
  }

  tags = {
    Name = "HelloWorld-${count.index}" # Unique name for each instance (e.g., HelloWorld-0, HelloWorld-1, HelloWorld-2)
  }
}

resource "aws_security_group" "web" {
  name        = "web-sg"
  description = "Web Security Group"

  ingress {
    description = "Allow SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP from anywhere"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}
