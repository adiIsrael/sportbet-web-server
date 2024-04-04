provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "sportbet-tf-state"
    key    = "sportbet-web-server/terraform.state"
    region = "us-east-1"
  }
}
