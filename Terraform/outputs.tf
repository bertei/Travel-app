output "vpc_id" {
  value = module.vpc.vpc_id
}
output "public_subnet_ids" {
  value = module.vpc.public_subnets_id
}

output "public_security_group_id" {
  value = module.public_sg.security_group_id
}

output "rds_security_group_id" {
  value = module.rds_public_sg.security_group_id
}
