#ALB
variable "alb_name" {
  type        = string
  description = "ALB name"
  default     = null
}

variable "alb_type" {
  type        = string
  description = "ALB type (application, gateway, networking)"
  default     = null
}

variable "alb_subnets" {
  type        = any
  description = "A list of subnet IDs to attach to the LB."
  default     = []
}

variable "alb_sgs" {
  type        = any
  description = "A list of security group IDs to assign to the LB."
  default     = []
}

#Target group
variable "tg_name" {
  type        = string
  description = "Target group name"
  default     = null
}

variable "tg_port" {
  type        = number
  description = "Port on which targets receive traffic, unless overridden when registering a specific target. Required when target_type is instance, ip or alb. Does not apply when target_type is lambda."
  default     = null
}

variable "tg_protocol" {
  type        = string
  description = "Protocol to use for routing traffic to the targets. Should be one of GENEVE, HTTP, HTTPS, TCP, TCP_UDP, TLS, or UDP."
  default     = null
}

variable "tg_targetype" {
  type        = string
  description = "Type of target which alb will redirect the requests. Can be an EC2, IP Addresses, Lambda, another ALB."
  default     = null
}

variable "vpc_id" {
  type        = string
  description = " Identifier of the VPC in which to create the target group. Required when target_type is instance, ip or alb."
  default     = null
}