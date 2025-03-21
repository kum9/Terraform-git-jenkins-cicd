terraform {
  backend "s3" {
    bucket = "mybucket-kum1"
    key    = "backend.tfstate"
    region = "us-east-1"
  }
}
