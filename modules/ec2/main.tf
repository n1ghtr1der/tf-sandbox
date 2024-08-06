resource "aws_instance" "sandbox_instance" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.access_key
  security_groups = [ var.instance_security_group ]
  associate_public_ip_address = true

  root_block_device {
    volume_size = var.disk_size
    volume_type = "gp3"
  }

  tags = {
    Name = "${var.instance_name}"
  }
}