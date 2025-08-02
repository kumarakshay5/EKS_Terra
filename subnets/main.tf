resource "aws_subnet" "this" {
  count                   = length(var.subnet_cidrs)
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidrs[count.index]
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = "${var.subnet_name_prefix}-${count.index}"
  }
}

resource "aws_route_table_association" "this" {
  count          = length(var.subnet_cidrs)
  subnet_id      = aws_subnet.this[count.index].id
  route_table_id = var.route_table_id
}
