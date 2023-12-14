variable "task_definitions" {
  type        = any
  description = "List of string containing the task definitions to create."
  default     = {}
}

variable "task_name" {
  type        = string
  description = "Task definition name"
  default     = null
}

variable "requires_compatibilities" {
  type        = any
  description = "Fargate, Fargate Spot, EC2"
  default     = []
}

variable "network_mode" {
  type        = string
  description = "none, bridge, awsvpc, and host"
  default     = null
}

##Container definitions
variable "container_name" {
  description = "ECS container name"
  type        = string
  default     = null
}

variable "image" {
  description = "ECS Task container image"
  type        = string
  default     = null
}

variable "cpu" {
  type        = number
  description = "CPU to allocate"
  default     = 512
}

variable "memory" {
  type        = number
  description = "Memory to allocate"
  default     = 1024
}

variable "container_port" {
  type        = number
  description = "Container Port, the one which will be open for connections."
  default     = 0
}

variable "host_port" {
  type        = number
  description = "Host Port"
  default     = 0
}

variable "db_hostname_value" {
  type        = any
  description = "DB Hostname value."
  default     = null
}