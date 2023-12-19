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
#output "ssm_param_arns" {
#  value = module.ecs_ssm.ssm_param_arns
#}
#
#output "ssm_db_host" {
#  value = module.ecs_ssm.ssm_db_host
#}
output "DB_HOSTNAME_SOPS" {
  value = module.ecs_ssm_sops.DB_HOSTNAME_SOPS
}