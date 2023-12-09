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
| [aws_internet_gateway.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route.igw_route](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.public_subnets_route_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.private_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azs"></a> [azs](#input\_azs) | Subnets AZ's | `list(string)` | `[]` | no |
| <a name="input_create_igw"></a> [create\_igw](#input\_create\_igw) | Enables IGW resource creation. | `bool` | `false` | no |
| <a name="input_create_igw_route"></a> [create\_igw\_route](#input\_create\_igw\_route) | Enables IGW route resource creation. | `bool` | `false` | no |
| <a name="input_enable_dns_hostnames"></a> [enable\_dns\_hostnames](#input\_enable\_dns\_hostnames) | A boolean flag to enable/disable DNS hostnames in the VPC. | `string` | `false` | no |
| <a name="input_igw_tag"></a> [igw\_tag](#input\_igw\_tag) | IGW tag name. | `string` | `false` | no |
| <a name="input_private_subnet_cidrs"></a> [private\_subnet\_cidrs](#input\_private\_subnet\_cidrs) | Private subnet CIDR values | `list(string)` | `[]` | no |
| <a name="input_public_subnet_cidrs"></a> [public\_subnet\_cidrs](#input\_public\_subnet\_cidrs) | Public subnet CIDR values | `list(string)` | `[]` | no |
| <a name="input_route_table_tag"></a> [route\_table\_tag](#input\_route\_table\_tag) | Route table tag name. | `string` | `false` | no |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | The VPC IPv4 CIDR block | `string` | `null` | no |
| <a name="input_vpc_tag"></a> [vpc\_tag](#input\_vpc\_tag) | Resource tag name | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_subnets_id"></a> [public\_subnets\_id](#output\_public\_subnets\_id) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
<!-- END_TF_DOCS -->