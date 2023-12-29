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

#ALB Listener
variable "listener_port" {
  type        = number
  description = " (Optional) Port on which the load balancer is listening. Not valid for Gateway Load Balancers."
  default     = null
}

variable "listener_protocol" {
  type        = string
  description = "(Optional) Protocol for connections from clients to the load balancer. For Application Load Balancers, valid values are HTTP and HTTPS, with a default of HTTP."
  default     = null
}

variable "ssl_policy" {
  type        = string
  description = "(Optional) Name of the SSL Policy for the listener. Required if protocol is HTTPS or TLS."
  default     = null
}

variable "certificate_arn" {
  type        = string
  description = "(Optional) ARN of the default SSL server certificate. Exactly one certificate is required if the protocol is HTTPS."
  default     = null
}

variable "listener_action_type" {
  type        = string
  description = "(Required) Type of routing action. Valid values are forward, redirect, fixed-response, authenticate-cognito and authenticate-oidc."
  default     = null
}

variable "target_group_arn" {
  type        = string
  description = "ARN of the Target Group to which to route traffic. Specify only if type is forward and you want to route to a single target group. To route to one or more target groups, use a forward block instead."
  default     = null
}

#variable "alb_listeners" {
#  type = any
#  description = "List of alb listeners"
#}

#variable "default_actions" {
#  type = any
#  description = "List of dynamic actions"
#}
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