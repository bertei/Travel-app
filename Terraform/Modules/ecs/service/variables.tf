variable "service_name" {
  type        = string
  description = "ECS Service name"
  default     = null
}

variable "cluster_id" {
  type        = string
  description = "ECS Cluster id retrieved from ecs cluster module."
  default     = null
}

variable "task_definition_arn" {
  type        = string
  description = "ECS Task definition arn retrieved from ecs task def module."
  default     = null
}

variable "launch_type" {
  type        = string
  description = "FARGATE, FARGATE_SPOT, EC2"
  default     = null
}

variable "desired_count" {
  type        = number
  description = "Amount of containers you want to run"
  default     = 1
}

variable "subnets_id" {
  type        = any
  description = "Subnets id's where the ecs container will live."
  default     = []
}

variable "security_groups_id" {
  type        = any
  description = "SG's id's which ecs container will utilize."
  default     = []
}

variable "target_group_arn" {
  type        = string
  description = "(Required for ALB/NLB) ARN of the Load Balancer target group to associate with the service."
  default     = null
}

variable "container_port" {
  type        = string
  description = "(Required) Port on the container to associate with the load balancer."
  default     = null
}

variable "container_name" {
  type        = string
  description = "(Required) Name of the container to associate with the load balancer (as it appears in a container definition)."
  default     = null
}