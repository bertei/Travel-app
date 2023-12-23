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
| [aws_alb_target_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_name"></a> [alb\_name](#input\_alb\_name) | ALB name | `string` | `null` | no |
| <a name="input_alb_sgs"></a> [alb\_sgs](#input\_alb\_sgs) | A list of security group IDs to assign to the LB. | `any` | `[]` | no |
| <a name="input_alb_subnets"></a> [alb\_subnets](#input\_alb\_subnets) | A list of subnet IDs to attach to the LB. | `any` | `[]` | no |
| <a name="input_alb_type"></a> [alb\_type](#input\_alb\_type) | ALB type (application, gateway, networking) | `string` | `null` | no |
| <a name="input_tg_name"></a> [tg\_name](#input\_tg\_name) | Target group name | `string` | `null` | no |
| <a name="input_tg_port"></a> [tg\_port](#input\_tg\_port) | Port on which targets receive traffic, unless overridden when registering a specific target. Required when target\_type is instance, ip or alb. Does not apply when target\_type is lambda. | `number` | `null` | no |
| <a name="input_tg_protocol"></a> [tg\_protocol](#input\_tg\_protocol) | Protocol to use for routing traffic to the targets. Should be one of GENEVE, HTTP, HTTPS, TCP, TCP\_UDP, TLS, or UDP. | `string` | `null` | no |
| <a name="input_tg_targetype"></a> [tg\_targetype](#input\_tg\_targetype) | Type of target which alb will redirect the requests. Can be an EC2, IP Addresses, Lambda, another ALB. | `string` | `null` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Identifier of the VPC in which to create the target group. Required when target\_type is instance, ip or alb. | `string` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->