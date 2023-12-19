resource "aws_ssm_parameter" "main" {
  for_each = nonsensitive(data.sops_file.sops_secret.data)

  name  = each.key
  value = each.value
  type  = "String"
 

  tags = {
    Name = "${each.key}"
  }
}

data "sops_file" "sops_secret" {
  source_file = "./ssm.enc.json"
}