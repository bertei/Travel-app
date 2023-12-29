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

resource "aws_alb_listener" "https_listener" {
  count = var.enable_https_listener ? 1 : 0

  load_balancer_arn = aws_alb.main.arn
  port              = var.https_listener_port
  protocol          = var.https_listener_protocol
  ssl_policy        = var.https_ssl_policy
  certificate_arn   = var.https_certificate_arn

  default_action {
    type             = var.https_listener_action_type
    target_group_arn = var.https_target_group_arn
  }

  tags = {
    Name = "${var.https_listener_tag}"
  }
}

resource "aws_alb_listener" "http_redirect_listener" {
  count = var.enable_http_listener ? 1 : 0

  load_balancer_arn = aws_alb.main.arn
  port              = var.http_listener_port
  protocol          = var.http_listener_protocol

  default_action {
    type = var.http_listener_action_type

    redirect {
      port        = var.redirect_port
      protocol    = var.redirect_protocol
      status_code = var.redirect_status_code
    }
  }

  tags = {
    Name = "${var.http_listener_tag}"
  }
}