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
| [aws_db_instance.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocated_storage"></a> [allocated\_storage](#input\_allocated\_storage) | The allocated storage in gibibytes | `number` | `null` | no |
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Specifies whether any database modifications are applied immediately, or during the next maintenance window. | `string` | `null` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | Database name | `string` | `null` | no |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | Database password | `string` | `null` | no |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | DB Subnet group name | `string` | `null` | no |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | Database username | `string` | `null` | no |
| <a name="input_engine"></a> [engine](#input\_engine) | Engine name | `string` | `null` | no |
| <a name="input_engine_ver"></a> [engine\_ver](#input\_engine\_ver) | Engine version | `string` | `null` | no |
| <a name="input_identifier"></a> [identifier](#input\_identifier) | Database identifier | `string` | `null` | no |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | Instance class | `string` | `null` | no |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final\_snapshot\_identifier | `bool` | `true` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | A list of VPC subnet IDs. | `any` | `[]` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | List of VPC SG's. | `any` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rds_db_hostname"></a> [rds\_db\_hostname](#output\_rds\_db\_hostname) | n/a |
<!-- END_TF_DOCS -->