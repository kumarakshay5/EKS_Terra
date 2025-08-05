output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.this.id
}

output "subnet_ids" {
  description = "IDs of the created subnets"
  value       = aws_subnet.this[*].id
}

output "route_table_id" {
  description = "ID of the route table"
  value       = aws_route_table.this.id
}
