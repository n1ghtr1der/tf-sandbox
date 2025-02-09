resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  
  tags = {
    Name = var.vpc_name
  }
}
resource "aws_subnet" "public" {
  count = length(var.public_subnets_cidrs)
  vpc_id = aws_vpc.this.id
  cidr_block = element(var.public_subnets_cidrs, count.index)
  availability_zone = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true
  tags = merge({
    Name = "${var.project_name}-public-subnet-${count.index + 1}"
  }, var.tags)
}
resource "aws_subnet" "private" {
  count = length(var.private_subnets_cidrs)
  vpc_id = aws_vpc.this.id
  cidr_block = element(var.private_subnets_cidrs, count.index)
  availability_zone = element(var.availability_zones, count.index)
  map_public_ip_on_launch = false
  tags = merge({
    Name = "${var.project_name}-private-subnet-${count.index + 1}"
  }, var.tags)
}
resource "aws_subnet" "database" {
  count = length(var.database_subnets_cidrs)
  vpc_id = aws_vpc.this.id
  cidr_block = element(var.database_subnets_cidrs, count.index)
  availability_zone = element(var.availability_zones, count.index)
  map_public_ip_on_launch = false
  tags = merge({
    Name = "${var.project_name}-private-subnet-${count.index + 1}"
  }, var.tags)
}
