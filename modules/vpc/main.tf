resource "aws_vpc" "this" {
  cidr_block = var.cidr_block
  tags = {
    Name = "vpc"
  }
}

resource "aws_subnet" "this" {
  count                   = var.subnet_count
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, count.index)
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-${count.index}"
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
}

resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }
}

resource "aws_route_table_association" "this" {
  count          = var.subnet_count
  subnet_id      = aws_subnet.this[count.index].id
  route_table_id = aws_route_table.this.id
}

