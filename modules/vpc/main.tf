resource "aws_vpc" "sandbox_vpc" {
  cidr_block = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_internet_gateway" "sandbox_igw" {
  vpc_id = aws_vpc.sandbox_vpc.id
  
  tags = {
    Name = "${var.project_name}-igw"
  }
}

resource "aws_subnet" "sandbox_subnet" {
  count = length(var.availability_zone)
  vpc_id = aws_vpc.sandbox_vpc.id
  availability_zone = element(var.availability_zone, count.index)
  cidr_block = element(var.subnet_cidr_blocks, count.index)
  tags = {
    Name = "${var.project_name}-subnet-${count.index + 1}"
  }
}

resource "aws_route_table" "sandbox_route_table" {
  count = length(var.availability_zone)
  vpc_id = aws_vpc.sandbox_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sandbox_igw.id
  }

  tags = {
    Name = "${var.project_name}-route-table"
  }
}

resource "aws_route_table_association" "sandbox_route_table_association" {
  count = length(var.availability_zone)
  subnet_id = element(aws_subnet.sandbox_subnet.*.id, count.index)
  route_table_id = element(aws_route_table.sandbox_route_table.*.id, count.index)
}

# resource "aws_security_group" "sandbox_front_end_sg" {
#   name = "${var.project_name}-front-end"
#   description = "${var.project_name} front end security group"
#   vpc_id = aws_vpc.sandbox_vpc.id

#   ingress {
#     from_port = 80
#     to_port = 80
#     protocol = "tcp"
#     cidr_blocks = [ var.vpc_cidr_block ]
#   }

#   ingress {
#     from_port = 443
#     to_port = 443
#     protocol = "tcp"
#     cidr_blocks = [ var.vpc_cidr_block ]
#   }

#   ingress {
#     from_port = 22
#     to_port = 22
#     protocol = "tcp"
#     cidr_blocks = [ var.vpc_cidr_block ]
#   }

#   egress {
#     from_port = 0
#     to_port = 0
#     protocol = -1
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "${var.project_name}-back-end-sg"
#   }
# }

# resource "aws_security_group" "sandbox_back_end_sg" {
#   name = "${var.project_name}-back-end"
#   description = "${var.project_name} back end security group"
#   vpc_id = aws_vpc.sandbox_vpc.id

#   ingress {
#     from_port = 3333
#     to_port = 3333
#     protocol = "tcp"
#     cidr_blocks = [ var.vpc_cidr_block ]
#   }

#   ingress {
#     from_port = 22
#     to_port = 22
#     protocol = "tcp"
#     cidr_blocks = [ var.vpc_cidr_block ]
#   }

#   egress {
#     from_port = 0
#     to_port = 0
#     protocol = -1
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "${var.project_name}-back-end-sg"
#   }
# }