<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_sops"></a> [sops](#requirement\_sops) | ~> 0.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_sops"></a> [sops](#provider\_sops) | ~> 0.5 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ssm_parameter.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [sops_file.sops_secret](https://registry.terraform.io/providers/carlpett/sops/latest/docs/data-sources/file) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_DB_HOSTNAME_ARN"></a> [DB\_HOSTNAME\_ARN](#output\_DB\_HOSTNAME\_ARN) | n/a |
| <a name="output_DB_HOSTNAME_SOPS"></a> [DB\_HOSTNAME\_SOPS](#output\_DB\_HOSTNAME\_SOPS) | n/a |
| <a name="output_DB_PASSWORD_ARN"></a> [DB\_PASSWORD\_ARN](#output\_DB\_PASSWORD\_ARN) | n/a |
| <a name="output_DB_PASSWORD_SOPS"></a> [DB\_PASSWORD\_SOPS](#output\_DB\_PASSWORD\_SOPS) | n/a |
| <a name="output_DB_USERNAME_ARN"></a> [DB\_USERNAME\_ARN](#output\_DB\_USERNAME\_ARN) | n/a |
| <a name="output_DB_USERNAME_SOPS"></a> [DB\_USERNAME\_SOPS](#output\_DB\_USERNAME\_SOPS) | n/a |
<!-- END_TF_DOCS -->