terraform {
  backend "s3" {
    bucket = "mybucket-kum1"
    key    = "modules/terraform.tfstate"
    region = "us-east-1"
  }
}
