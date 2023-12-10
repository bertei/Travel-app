resource "aws_security_group" "main" {
  #count = length(var.sg_ingress) > 0 && length(var.sg_egress) > 0 ? 1 : 0

  vpc_id = var.vpc_id
  name   = var.sg_name

  dynamic "ingress" {
    for_each = var.sg_ingress

    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
  dynamic "egress" {
    for_each = var.sg_egress

    content {
      description = egress.value.description
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = {
    Name = var.sg_name
  }
}