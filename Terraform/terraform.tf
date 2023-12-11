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
  azs                = ["us-east-1a", "us-east-1b"]
  public_subnets_tag = "travelapp-public-subnet"

  ##IGW & Route Variables definition
  create_igw       = true
  igw_tag          = "travelapp-igw"
  create_igw_route = true
  route_table_tag  = "travelapp-routetable"
}

module "public_sg" {
  source = "./Modules//security_group"

  vpc_id  = module.vpc.vpc_id
  sg_name = "travelapp-public-sg"

  sg_ingress = {
    rule-1 = {
      description = "Allow HTTP requests"
      from_port   = 80
      to_port     = 80
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
    rule-2 = {
      description = "Allow HTTPS requests"
      from_port   = 443
      to_port     = 443
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  sg_egress = {
    rule-1 = {
      description = "Allow all outbound traffic"
      from_port   = 0
      to_port     = 0
      protocol    = -1
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

module "rds_public_sg" {
  source = "./Modules//security_group"

  vpc_id  = module.vpc.vpc_id
  sg_name = "travelapp-rds-public-sg"

  sg_ingress = {
    rule-1 = {
      description = "Allow all inbound traffic to RDS"
      from_port   = 3306
      to_port     = 3306
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

module "ecr" {
  source = "./Modules//ecr"

  ecr_repo_name = "travelapp-ecr"
}

module "ecs_cluster" {
  source = "./Modules/ecs//cluster"

  ecs_cluster_name = "travelapp-cluster"
}