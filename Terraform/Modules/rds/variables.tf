##Database variables
variable "db_name" {
  type        = string
  description = "Database name"
  default     = null
}

variable "identifier" {
  type        = string
  description = "Database identifier"
  default     = null
}

variable "engine" {
  type        = string
  description = "Engine name"
  default     = null
}

variable "engine_ver" {
  type        = string
  description = "Engine version"
  default     = null
}

variable "db_username" {
  type        = string
  description = "Database username"
  default     = null
}

variable "db_password" {
  type        = string
  description = "Database password"
  default     = null
}

variable "instance_class" {
  type        = string
  description = "Instance class"
  default     = null
}

variable "allocated_storage" {
  type        = number
  description = "The allocated storage in gibibytes"
  default     = null
}

variable "apply_immediately" {
  type        = string
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window."
  default     = null
}

variable "skip_final_snapshot" {
  type        = bool
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier"
  default     = true
}

variable "publicly_accessible" {
  type        = bool
  default     = true
}


#Database subnet group variables
variable "db_subnet_group_name" {
  type        = string
  description = "DB Subnet group name"
  default     = null
}

variable "subnet_ids" {
  type        = any
  description = "A list of VPC subnet IDs."
  default     = []
}

variable "vpc_security_group_ids" {
  type = any
  description = "List of VPC SG's."
  default = []
}
