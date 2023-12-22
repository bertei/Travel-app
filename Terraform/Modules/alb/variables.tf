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