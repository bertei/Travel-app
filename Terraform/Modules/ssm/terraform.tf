resource "aws_ssm_parameter" "main" {
  for_each = var.ssm_parameters

  name  = each.key
  type  = each.value.type
  value = base64decode(each.value.value)

  tags = {
    Name = "${each.key}-tag"
  }
}