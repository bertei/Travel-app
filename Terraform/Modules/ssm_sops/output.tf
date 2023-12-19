output "DB_HOSTNAME_SOPS" {
  value = nonsensitive(data.sops_file.sops_secret.data["DB_HOSTNAME"])
}