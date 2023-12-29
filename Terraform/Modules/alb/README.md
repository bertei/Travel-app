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
| [aws_alb_listener.http_redirect_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_listener) | resource |
| [aws_alb_listener.https_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_listener) | resource |
| [aws_alb_target_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_name"></a> [alb\_name](#input\_alb\_name) | ALB name | `string` | `null` | no |
| <a name="input_alb_sgs"></a> [alb\_sgs](#input\_alb\_sgs) | A list of security group IDs to assign to the LB. | `any` | `[]` | no |
| <a name="input_alb_subnets"></a> [alb\_subnets](#input\_alb\_subnets) | A list of subnet IDs to attach to the LB. | `any` | `[]` | no |
| <a name="input_alb_type"></a> [alb\_type](#input\_alb\_type) | ALB type (application, gateway, networking) | `string` | `null` | no |
| <a name="input_enable_http_listener"></a> [enable\_http\_listener](#input\_enable\_http\_listener) | Enables https listener | `bool` | `false` | no |
| <a name="input_enable_https_listener"></a> [enable\_https\_listener](#input\_enable\_https\_listener) | Enables https listener | `bool` | `false` | no |
| <a name="input_http_listener_action_type"></a> [http\_listener\_action\_type](#input\_http\_listener\_action\_type) | (Required) Type of routing action. Valid values are forward, redirect, fixed-response, authenticate-cognito and authenticate-oidc. | `string` | `null` | no |
| <a name="input_http_listener_port"></a> [http\_listener\_port](#input\_http\_listener\_port) | (Optional) Port on which the load balancer is listening. Not valid for Gateway Load Balancers. | `number` | `null` | no |
| <a name="input_http_listener_protocol"></a> [http\_listener\_protocol](#input\_http\_listener\_protocol) | (Optional) Protocol for connections from clients to the load balancer. For Application Load Balancers, valid values are HTTP and HTTPS, with a default of HTTP. | `string` | `null` | no |
| <a name="input_http_listener_tag"></a> [http\_listener\_tag](#input\_http\_listener\_tag) | HTTP listener tag | `string` | `null` | no |
| <a name="input_https_certificate_arn"></a> [https\_certificate\_arn](#input\_https\_certificate\_arn) | (Optional) ARN of the default SSL server certificate. Exactly one certificate is required if the protocol is HTTPS. | `string` | `null` | no |
| <a name="input_https_listener_action_type"></a> [https\_listener\_action\_type](#input\_https\_listener\_action\_type) | (Required) Type of routing action. Valid values are forward, redirect, fixed-response, authenticate-cognito and authenticate-oidc. | `string` | `null` | no |
| <a name="input_https_listener_port"></a> [https\_listener\_port](#input\_https\_listener\_port) | (Optional) Port on which the load balancer is listening. Not valid for Gateway Load Balancers. | `number` | `null` | no |
| <a name="input_https_listener_protocol"></a> [https\_listener\_protocol](#input\_https\_listener\_protocol) | (Optional) Protocol for connections from clients to the load balancer. For Application Load Balancers, valid values are HTTP and HTTPS, with a default of HTTP. | `string` | `null` | no |
| <a name="input_https_listener_tag"></a> [https\_listener\_tag](#input\_https\_listener\_tag) | HTTPS listener tag | `string` | `null` | no |
| <a name="input_https_ssl_policy"></a> [https\_ssl\_policy](#input\_https\_ssl\_policy) | (Optional) Name of the SSL Policy for the listener. Required if protocol is HTTPS or TLS. | `string` | `null` | no |
| <a name="input_https_target_group_arn"></a> [https\_target\_group\_arn](#input\_https\_target\_group\_arn) | ARN of the Target Group to which to route traffic. Specify only if type is forward and you want to route to a single target group. To route to one or more target groups, use a forward block instead. | `string` | `null` | no |
| <a name="input_redirect_port"></a> [redirect\_port](#input\_redirect\_port) | (Optional) Port. Specify a value from 1 to 65535. | `number` | `null` | no |
| <a name="input_redirect_protocol"></a> [redirect\_protocol](#input\_redirect\_protocol) | (Optional) Protocol. Valid values are HTTP, HTTPS | `string` | `null` | no |
| <a name="input_redirect_status_code"></a> [redirect\_status\_code](#input\_redirect\_status\_code) | (Required) HTTP redirect code. The redirect is either permanent (HTTP\_301) or temporary (HTTP\_302). | `string` | `null` | no |
| <a name="input_tg_name"></a> [tg\_name](#input\_tg\_name) | Target group name | `string` | `null` | no |
| <a name="input_tg_port"></a> [tg\_port](#input\_tg\_port) | Port on which targets receive traffic, unless overridden when registering a specific target. Required when target\_type is instance, ip or alb. Does not apply when target\_type is lambda. | `number` | `null` | no |
| <a name="input_tg_protocol"></a> [tg\_protocol](#input\_tg\_protocol) | Protocol to use for routing traffic to the targets. Should be one of GENEVE, HTTP, HTTPS, TCP, TCP\_UDP, TLS, or UDP. | `string` | `null` | no |
| <a name="input_tg_targetype"></a> [tg\_targetype](#input\_tg\_targetype) | Type of target which alb will redirect the requests. Can be an EC2, IP Addresses, Lambda, another ALB. | `string` | `null` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Identifier of the VPC in which to create the target group. Required when target\_type is instance, ip or alb. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_dns"></a> [alb\_dns](#output\_alb\_dns) | n/a |
| <a name="output_alb_tg_arn"></a> [alb\_tg\_arn](#output\_alb\_tg\_arn) | n/a |
| <a name="output_alb_zone_id"></a> [alb\_zone\_id](#output\_alb\_zone\_id) | n/a |
<!-- END_TF_DOCS -->