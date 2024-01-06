output "DB_HOSTNAME_SOPS" {
  value = nonsensitive(data.sops_file.sops_secret.data["DB_HOSTNAME"])
}

output "DB_USERNAME_SOPS" {
  value = data.sops_file.sops_secret.data["DB_USERNAME"]
  sensitive = true
}

output "DB_PASSWORD_SOPS" {
  value = data.sops_file.sops_secret.data["DB_PASSWORD"]
  sensitive = true
}

#The ones ecs task def needs to set up the env vars.
output "DB_HOSTNAME_ARN" {
  value = aws_ssm_parameter.main["DB_HOSTNAME"].arn
}

output "DB_USERNAME_ARN" {
  value = aws_ssm_parameter.main["DB_USERNAME"].arn
}

output "DB_PASSWORD_ARN" {
  value = aws_ssm_parameter.main["DB_PASSWORD"].arn
}

output "DB_NAME_ARN" {
  value = aws_ssm_parameter.main["DB_NAME"].arn
}