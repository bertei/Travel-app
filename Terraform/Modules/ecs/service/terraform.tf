resource "aws_ecs_service" "main" {
  name            = var.service_name
  cluster         = var.cluster_id
  task_definition = var.task_definition_arn
  launch_type     = var.launch_type
  desired_count   = var.desired_count

  network_configuration {
    subnets          = var.subnets_id
    assign_public_ip = true
    security_groups  = var.security_groups_id
  }

  tags = {
    Name = "${var.service_name}"
  }
}