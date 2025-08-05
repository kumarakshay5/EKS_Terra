variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet_count" {
  description = "Number of subnets to create"
  type        = number
}

variable "azs" {
  description = "List of Availability Zones to use for subnets"
  type        = list(string)
}
