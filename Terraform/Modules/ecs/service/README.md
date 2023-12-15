<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecs_service.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | ECS Cluster id retrieved from ecs cluster module. | `string` | `null` | no |
| <a name="input_desired_count"></a> [desired\_count](#input\_desired\_count) | Amount of containers you want to run | `number` | `1` | no |
| <a name="input_launch_type"></a> [launch\_type](#input\_launch\_type) | FARGATE, FARGATE\_SPOT, EC2 | `string` | `null` | no |
| <a name="input_security_groups_id"></a> [security\_groups\_id](#input\_security\_groups\_id) | SG's id's which ecs container will utilize. | `any` | `[]` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | ECS Service name | `string` | `null` | no |
| <a name="input_subnets_id"></a> [subnets\_id](#input\_subnets\_id) | Subnets id's where the ecs container will live. | `any` | `[]` | no |
| <a name="input_task_definition_arn"></a> [task\_definition\_arn](#input\_task\_definition\_arn) | ECS Task definition arn retrieved from ecs task def module. | `string` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->