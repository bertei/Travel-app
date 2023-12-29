resource "aws_alb" "main" {
  name               = var.alb_name
  load_balancer_type = var.alb_type
  subnets            = var.alb_subnets
  security_groups    = var.alb_sgs

  tags = {
    Name = "${var.alb_name}"
  }
}

resource "aws_alb_target_group" "main" {
  name        = var.tg_name
  port        = var.tg_port
  protocol    = var.tg_protocol
  target_type = var.tg_targetype
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.tg_name}"
  }
}

#resource "aws_alb_listener" "main" {
#  
#  load_balancer_arn = aws_alb.main.arn
#  port              = var.listener_port
#  protocol          = var.listener_protocol
#  ssl_policy        = var.ssl_policy
#  certificate_arn   = var.certificate_arn
#
#  default_action {
#    type             = var.listener_action_type
#    target_group_arn = var.target_group_arn
#  }
#}