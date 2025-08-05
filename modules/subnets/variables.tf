variable "vpc_id" {
  type        = string
  description = "ID of the VPC where subnets will be created"
}

variable "route_table_id" {
  type        = string
  description = "Route table ID to associate with subnets"
}

variable "subnet_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for subnets"
}

variable "azs" {
  type        = list(string)
  description = "Availability zones for subnets"
}

variable "subnet_name_prefix" {
  type        = string
  description = "Prefix for subnet names"
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Should public IPs be assigned on launch?"
  default     = true
}
