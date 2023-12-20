##VPC
output "vpc_id" {
  value = module.vpc.vpc_id
}

##Subnets
output "public_subnet_ids" {
  value = module.vpc.public_subnets_id
}

output "public_security_group_id" {
  value = module.public_sg.security_group_id
}

output "rds_security_group_id" {
  value = module.rds_public_sg.security_group_id
}

##ECR
output "ecr_repo_url" {
  value = module.ecr.ecr_repo_url
}

##ECS
output "ecs_cluster_id" {
  value = module.ecs_cluster.ecs_cluster_id
}

##SSM
output "db_hostname_sops" {
  value = module.ecs_ssm_sops.DB_HOSTNAME_SOPS
  sensitive = true
}

output "db_username_sops" {
  value = module.ecs_ssm_sops.DB_USERNAME_SOPS
  sensitive = true
}

output "db_password_sops" {
  value = module.ecs_ssm_sops.DB_PASSWORD_SOPS
  sensitive = true
}

output "DB_HOSTNAME_ARN" {
  value = module.ecs_ssm_sops.DB_HOSTNAME_ARN
}

##RDS
output "rds_db_hostname" {
  value = module.rds.rds_db_hostname
}