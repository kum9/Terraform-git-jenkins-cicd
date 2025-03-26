resource "aws_security_group" "web" {
  name        = "web-sg-${random_id.suffix.hex}"  # Ensure unique name for each apply
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
    Name = "web-sg-${random_id.suffix.hex}"
  }
}

resource "random_id" "suffix" {
  byte_length = 4  # This will generate a random suffix for the security group name
}
