locals {
  mutability = var.mutability == true ? "MUTABLE" : "IMMUTABLE"
}

resource "aws_ecr_repository" "main" {
  name                 = var.ecr_repo_name
  image_tag_mutability = local.mutability

  encryption_configuration {
    encryption_type = "KMS"
  }

  tags = {
    Name = "${var.ecr_repo_name}"
  }
}