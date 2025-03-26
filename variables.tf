variable "ami_id" {
  description = "AMI ID to launch the EC2 instance"
  type        = string
  default     = "ami-0f9de6e2d2f067fca" # Default valid AMI ID
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.medium" # Default instance type
}

variable "volume_size" {
  description = "Root volume size in GB"
  type        = number
  default     = 30 # Default volume size in GB
}

variable "volume_type" {
  description = "Root volume type"
  type        = string
  default     = "gp2" # Default volume type
}

variable "delete_on_termination" {
  description = "Delete the root volume on instance termination"
  type        = bool
  default     = true # Default to delete the root volume on instance termination
}
