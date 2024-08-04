resource "aws_security_group" "sandbox_front_end_sg" {
  name = "${var.project_name}-front-end"
  description = "${var.project_name} front end security group"
  vpc_id = aws_vpc.sandbox_vpc.id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ aws_vpc.sandbox_vpc.cidr_block ]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [ aws_vpc.sandbox_vpc.cidr_block ]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ aws_vpc.sandbox_vpc.cidr_block ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-back-end-sg"
  }
}

resource "aws_security_group" "sandbox_back_end_sg" {
  name = "${var.project_name}-back-end"
  description = "${var.project_name} back end security group"

  ingress {
    from_port = 3333
    to_port = 3333
    protocol = "tcp"
    cidr_blocks = [ aws_vpc.sandbox_vpc.cidr_block ]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ aws_vpc.sandbox_vpc.cidr_block ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-back-end-sg"
  }
}