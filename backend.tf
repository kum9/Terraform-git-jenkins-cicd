terraform {
  backend "s3" {
    bucket = "mybucket-kum1"
    key    = "backend.tfstate"  # Set the correct state file name
    region = "us-east-1"
  }
}
