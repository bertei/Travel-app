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

output "DB_HOSTNAME_ARN" {
  value = aws_ssm_parameter.main["DB_HOSTNAME"].arn
}