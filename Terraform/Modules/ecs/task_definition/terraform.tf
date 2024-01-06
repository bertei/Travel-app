resource "aws_ecs_task_definition" "main" {
  family = var.task_name

  container_definitions = jsonencode([
    {
      name      = "${var.container_name}"
      image     = "${var.image}:${var.image_version}"
      cpu       = var.cpu
      memory    = var.memory
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.host_port
        }
      ]
      secrets = [
        {
          name      = "DB_HOST"
          valueFrom = var.db_hostname_value
        },
        {
          name      = "DB_USERNAME"
          valueFrom = var.db_username_value
        },
        {
          name      = "DB_PASSWORD"
          valueFrom = var.db_password_value  
        },
        {
          name      = "DB_NAME"
          valueFrom = var.db_name_value
        }
      ]
    }
  ])

  requires_compatibilities = var.requires_compatibilities
  network_mode             = var.network_mode
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = aws_iam_role.main.arn

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }

  tags = {
    Name = var.task_name
  }
}

resource "aws_iam_role" "main" {
  name               = "ECS-TravelApp-Role"
  assume_role_policy = data.aws_iam_policy_document.main.json

  tags = {
    Name = "ECS-TravelApp-Role"
  }
}

data "aws_iam_policy_document" "main" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_policy" "main" {
  name        = "ECS-Allow-All"
  path        = "/"
  description = "ECS Custom policy allowing permissions on ECR, Cloudwatch, SSM, KMS."
  policy      = data.aws_iam_policy_document.custom.json
}

data "aws_iam_policy_document" "custom" {
  statement {
    sid = "ecsAllowAll"
    actions = [
      "ecr:GetAuthorizationToken",
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "secretsmanager:*",
      "kms:*",
      "ssm:*"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy_attachment" "main" {
  role       = aws_iam_role.main.name
  policy_arn = aws_iam_policy.main.arn
}

