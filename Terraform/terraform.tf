#Statefile managed manually.
terraform {
  backend "s3" {
    bucket = "travelapp-tf-state"
    key    = "terraform.tfstate"
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

module "vpc" {
  source = "./Modules//vpc"

  #VPC Variables definition
  vpc_cidr_block       = "10.0.0.0/24"
  vpc_tag              = "travelapp-vpc"
  enable_dns_hostnames = true #Required for RDS database setup.

  ##Subnet Variables definition
  public_subnet_cidrs = ["10.0.0.0/28", "10.0.0.16/28"]
  #private_subnet_cidrs = ["10.0.3.0/24"]
  azs = ["us-east-1a", "us-east-1b"]

  ##IGW Variables definition
  create_igw       = true
  igw_tag          = "travelapp-igw"
  create_igw_route = true
}