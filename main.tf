terraform {
  backend "s3" {
    bucket       = "prxdpt-tf-test-bucket"
    key          = "dev/terraform.tfstate"
    region       = "us-east-1"
    profile      = "default"
    encrypt      = true
    use_lockfile = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

#create a s3 bucket
resource "aws_s3_bucket" "example" {
  bucket = "prxdpt-tf-test-bucket"

  tags = {
    Name        = "tf state check"
    Environment = "Dev"
  }
}
