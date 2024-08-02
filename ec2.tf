resource "aws_key_pair" "sandbox_key_pair" {
  key_name = "${var.project_name}"
  public_key = "${var.key_pair_pub_key}"
}

resource "aws_instance" "sandbox_backend" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = aws_key_pair.sandbox_key_pair.key_name
  security_groups = [aws_security_group.sandbox_back_sg.name]
  associate_public_ip_address = true

  root_block_device {
    volume_size = var.back_end_disk_size
  }

  tags = {
    Name = "${var.project_name}-backend-end-instance"
  }
}

resource "aws_instance" "sandbox_front" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = aws_key_pair.sandbox_key_pair.key_name
  security_groups = [aws_security_group.sandbox_front_sg.name]
  associate_public_ip_address = true

  root_block_device {
    volume_size = var.front_end_disk_size
  }

  tags = {
    Name = "${var.project_name}-front-end-instance"
  }
}