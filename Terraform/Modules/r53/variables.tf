variable "zone_id" {
  type = string
  description = "(Required) Hosted zone ID for a CloudFront distribution, S3 bucket, ELB, or Route 53 hosted zone"
  default = null
}

variable "record_name" {
  type = string
  description = "(Required) DNS domain name for a CloudFront distribution, S3 bucket, ELB, or another resource record set in this hosted zone"
  default = null
}

variable "record_type" {
  type = string
  description = "(Required) The record type. Valid values are A, AAAA, CAA, CNAME, DS, MX, NAPTR, NS, PTR, SOA, SPF, SRV and TXT."
  default = null
}

variable "alias_name" {
  type = string
  description = "(Required) DNS domain name for a CloudFront distribution, S3 bucket, ELB, or another resource record set in this hosted zone."
  default = null
}

variable "alias_zoneid" {
  type = string
  description = "(Required) Hosted zone ID for a CloudFront distribution, S3 bucket, ELB, or Route 53 hosted zone."
  default = null
}

variable "evaluate_target_health" {
  type = bool
  description = "Required) Set to true if you want Route 53 to determine whether to respond to DNS queries using this resource record set by checking the health of the resource record set."
  default = false
}