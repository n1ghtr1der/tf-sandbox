resource "aws_eip" "this" {
  count = local.is_dev ? 1 : length(var.public_subnets_cidrs)
  domain = "vpc"

  tags = merge({
    Name = "${var.project_name}-nat-gateway-eip"
  })
  lifecycle {
    ignore_changes = []
  }
}

resource "aws_nat_gateway" "this" {
  count = local.is_dev ? 1 : length(var.private_subnets_cidrs)
  subnet_id = local.is_dev ? aws_subnet.public[0].id : element(var.public_subnets_cidrs, count.index)
  allocation_id = local.is_dev ? aws_eip.this[0].id : element(aws_eip.this.*.id, count.index)
  tags = merge({
    Name = "${var.project_name}-nat-gateway"
  })
  lifecycle {
    ignore_changes = []
  }
}