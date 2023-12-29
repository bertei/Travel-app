variable "domain_name" {
  type        = string
  description = "(Required) Domain name for which the certificate should be issued"
  default     = null
}

variable "validation_method" {
  type        = string
  description = "(Optional) Which method to use for validation. DNS or EMAIL are valid. This parameter must not be set for certificates that were imported into ACM and then into Terraform."
  default     = null
}

variable "acm_tag_name" {
  type        = string
  description = "ACM Resource tag name"
}