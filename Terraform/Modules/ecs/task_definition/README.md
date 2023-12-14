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
| [aws_ecs_task_definition.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_iam_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.custom](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_name"></a> [container\_name](#input\_container\_name) | ECS container name | `string` | `null` | no |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | Container Port, the one which will be open for connections. | `number` | `0` | no |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | CPU to allocate | `number` | `512` | no |
| <a name="input_db_hostname_value"></a> [db\_hostname\_value](#input\_db\_hostname\_value) | DB Hostname value. | `any` | `null` | no |
| <a name="input_host_port"></a> [host\_port](#input\_host\_port) | Host Port | `number` | `0` | no |
| <a name="input_image"></a> [image](#input\_image) | ECS Task container image | `string` | `null` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | Memory to allocate | `number` | `1024` | no |
| <a name="input_network_mode"></a> [network\_mode](#input\_network\_mode) | none, bridge, awsvpc, and host | `string` | `null` | no |
| <a name="input_requires_compatibilities"></a> [requires\_compatibilities](#input\_requires\_compatibilities) | Fargate, Fargate Spot, EC2 | `any` | `[]` | no |
| <a name="input_task_definitions"></a> [task\_definitions](#input\_task\_definitions) | List of string containing the task definitions to create. | `any` | `{}` | no |
| <a name="input_task_name"></a> [task\_name](#input\_task\_name) | Task definition name | `string` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->