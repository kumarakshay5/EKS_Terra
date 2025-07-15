variable "vpc_id" {
  type        = string
  description = "VPC ID to associate subnets"
}

variable "route_table_id" {
  type        = string
  description = "Route table ID for subnet association"
}
