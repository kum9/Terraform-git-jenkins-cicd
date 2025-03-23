module "sg" {
  source = "./modules/sg"
}

module "ec2" {
  source            = "./modules/ec2"
  security_group_id = module.sg.security_group_id # Correctly referencing security group ID

  ami_id                = var.ami_id
  instance_type         = var.instance_type
  volume_size           = var.volume_size
  volume_type           = var.volume_type
  delete_on_termination = var.delete_on_termination
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

resource "aws_instance" "web" {
  ami             = var.ami_id        # Reference the valid AMI ID
  instance_type   = var.instance_type # Directly set the instance type to t2.medium
  security_groups = [aws_security_group.web.name]  # Now referencing aws_security_group.web correctly

  count = 2 # Create 2 instances

  # Define root volume size (30 GB)
  root_block_device {
    volume_size           = var.volume_size           # Set the volume size to 30 GB
    volume_type           = var.volume_type           # General Purpose SSD (can be changed to gp3 or other types)
    delete_on_termination = var.delete_on_termination # Set to true so the volume will be deleted when the instance is terminated
  }

  tags = {
    Name = "HelloWorld-${count.index}" # Unique name for each instance (e.g., HelloWorld-0, HelloWorld-1)
  }
}
