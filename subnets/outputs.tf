output "subnet_ids" {
  value = aws_subnet.this[*].id
}
