# Private Subnets
resource "aws_route_table" "private" {
  count = length(var.private_subnets_cidrs)
  vpc_id = aws_vpc.this.id
}
resource "aws_route" "private_nat" {
  count = length(aws_internet_gateway.this)
  route_table_id = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = element(aws_nat_gateway.this.*.id, count.index)
}
resource "aws_route" "private_vpc_connection" {
  count = length(var.vpc_peering)
  route_table_id = aws_route_table.private.id
  destination_cidr_block = var.vpc_peering.cidr
  vpc_peering_connection_id = var.vpc_peering.connection_id
}
resource "aws_route_table_association" "private" {
  count = length(var.private_subnets_cidrs)
  subnet_id = element(aws_subnet.private.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}

# Database Subnets
resource "aws_route_table" "database" {
  count = length(var.database_subnets_cidrs)
  vpc_id = aws_vpc.this.id
}
resource "aws_route" "database_nat" {
  count = length(aws_internet_gateway.this)
  route_table_id = aws_route_table.database.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = element(aws_nat_gateway.this.*.id, count.index)
}
resource "aws_route" "database_vpc_connection" {
  count = length(var.vpc_peering)
  route_table_id = aws_route_table.database.id
  destination_cidr_block = var.vpc_peering.cidr
  vpc_peering_connection_id = var.vpc_peering.connection_id
}
resource "aws_route_table_association" "database" {
  count = length(var.database_subnets_cidrs)
  subnet_id = element(aws_subnet.database.id, count.index)
  route_table_id = element(aws_route_table.database.*.id, count.index)
}

# Public Subnets
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id
  tags = merge({
    Name = "${var.project_name}-public-route-table"
  })
  lifecycle {
    ignore_changes = []
  }
}
resource "aws_route" "public_igw" {
  route_table_id = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.this[0].id
}
resource "aws_route_table_association" "public" {
  count = length(var.public_subnets_cidrs)
  subnet_id = element(aws_subnet.public.id, count.index)
  route_table_id = aws_route_table.public.id
}