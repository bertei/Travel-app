resource "aws_alb" "main" {
  name               = var.alb_name
  load_balancer_type = var.alb_type
  subnets            = var.alb_subnets
  security_groups    = var.alb_sgs

  tags = {
    Name = "{var.alb_name}"
  }
}