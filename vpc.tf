resource "aws_vpc" "ecorp_vpc" {
  cidr_block = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Owner: "${var.vpc_owner}"
    Name: "${var.vpc_name}"
  }
}