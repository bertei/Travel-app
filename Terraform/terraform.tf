#Statefile managed manually.
terraform {
  backend "s3" {
    bucket = "travelapp-tf-state"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
  required_providers {
    sops = {
      source  = "carlpett/sops"
      version = "~> 0.5"
    }
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

provider "sops" {}

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

module "ecs_taskdef_travelapp" {
  source = "./Modules/ecs//task_definition"

  #Task definitions
  task_name                = "travelapp-taskdefintion"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  image_version            = "1"
  #Container definitions
  container_name    = "travelapp-container"
  image             = module.ecr.ecr_repo_url
  container_port    = 80
  host_port         = 80
  db_hostname_value = module.ecs_ssm_sops.DB_HOSTNAME_ARN
  db_username_value = module.ecs_ssm_sops.DB_USERNAME_ARN
  db_password_value = module.ecs_ssm_sops.DB_PASSWORD_ARN
}

#module "ecs_service" {
#  source = "./Modules/ecs//service"
#
#  service_name        = "travelapp-service"
#  cluster_id          = module.ecs_cluster.ecs_cluster_id
#  task_definition_arn = module.ecs_taskdef_travelapp.ecs_taskdef_arn
#  launch_type         = "FARGATE"
#
#  subnets_id         = module.vpc.public_subnets_id
#  security_groups_id = [module.public_sg.security_group_id]
#}

module "ecs_ssm_sops" {
  source = "./Modules//ssm_sops"
}

#module "rds" {
#  source = "./Modules//rds"
#
#  #Config parameters
#  db_name           = "travelapprds"
#  identifier        = "travelapp-identifier"
#  db_username       = module.ecs_ssm_sops.DB_USERNAME_SOPS
#  db_password       = module.ecs_ssm_sops.DB_PASSWORD_SOPS
#  engine            = "mysql"
#  engine_ver        = "8.0.33"
#  instance_class    = "db.t3.micro"
#  apply_immediately = true
#  allocated_storage = 20
#
#  #Networking parameters
#  subnet_ids             = module.vpc.public_subnets_id
#  vpc_security_group_ids = module.rds_public_sg.security_group_id
#
#  #DB subnet group
#  db_subnet_group_name = "travelapp-group"
#}

module "ecs_alb" {
  source = "./Modules//alb"

  #ALB Definitions
  alb_name    = "travelapp-alb"
  alb_type    = "application"
  alb_subnets = module.vpc.public_subnets_id
  alb_sgs     = [module.public_sg.security_group_id]

  #ALB Listener Definitions
  
 

  #Target Group Definitions
  tg_name      = "travelapp-tg"
  tg_port      = "80"
  tg_protocol  = "HTTP"
  tg_targetype = "ip"
  vpc_id       = module.vpc.vpc_id
}

module "ecs_r53" {
  source = "./Modules//r53"

  #R53 Definitions
  record_name  = "travelapp.bernatei.com"
  record_type  = "A"
  alias_name   = module.ecs_alb.alb_dns
  alias_zoneid = module.ecs_alb.alb_zone_id
}

module "ecs_acm" {
  source = "./Modules//acm"

  domain_name       = "travelapp.bernatei.com"
  validation_method = "DNS"
  acm_tag_name      = "travelapp-acm"
}