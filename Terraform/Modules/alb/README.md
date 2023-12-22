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
| [aws_alb.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_name"></a> [alb\_name](#input\_alb\_name) | ALB name | `string` | `null` | no |
| <a name="input_alb_sgs"></a> [alb\_sgs](#input\_alb\_sgs) | A list of security group IDs to assign to the LB. | `any` | `[]` | no |
| <a name="input_alb_subnets"></a> [alb\_subnets](#input\_alb\_subnets) | A list of subnet IDs to attach to the LB. | `any` | `[]` | no |
| <a name="input_alb_type"></a> [alb\_type](#input\_alb\_type) | ALB type (application, gateway, networking) | `string` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->