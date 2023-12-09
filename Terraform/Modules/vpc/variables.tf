##VPC Variables
variable "vpc_cidr_block" {
  description = "The VPC IPv4 CIDR block"
  type        = string
  default     = null
}

variable "vpc_tag" {
  description = "Resource tag name"
  type        = string
  default     = null
}

variable "enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC."
  type        = string
  default     = false
}

##Subnet Variables
variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public subnet CIDR values"
  default     = []
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private subnet CIDR values"
  default     = []
}

variable "azs" {
  type        = list(string)
  description = "Subnets AZ's"
  default     = []
}


##IGW
variable "create_igw" {
  type        = bool
  description = "Enables IGW resource creation."
  default     = false
}

variable "igw_tag" {
  type        = string
  description = "IGW tag name."
  default     = false
}

##Route table
variable "route_table_tag" {
  type        = string
  description = "Route table tag name."
  default     = false
}

variable "create_igw_route" {
  type        = bool
  description = "Enables IGW route resource creation."
  default     = false
}