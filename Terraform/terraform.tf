#Statefile managed manually.
terraform {
  backend "s3" {
    bucket = "travelapp-tf-state"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Environment = "Test"
      Name        = "Example"
      Managed-by  = "Terraform"
    }
  }
}