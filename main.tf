resource "aws_key_pair" "sandbox_key_pair" {
  key_name = "${var.project_name}"
  public_key = "${var.key_pair_pub_key}"
}

module "sandbox_vpc" {
  source = "./modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  project_name = var.project_name
  subnet_cidr_blocks = var.subnet_cidr_blocks
  availability_zone = var.availability_zone
  environment = var.environment
}

module "front_end_sandbox_ec2_instance" {
  source = "./modules/ec2"
  project_name = var.project_name
  environment = var.environment
  instance_security_group = module.sandbox_vpc.sandbox_front_end_sg_id
  instance_name = local.front_end_instance_name
  access_key = aws_key_pair.sandbox_key_pair.key_name
}

module "back_end_sandbox_ec2_instance" {
  source = "./modules/ec2"
  project_name = var.project_name
  environment = var.environment
  instance_security_group = module.sandbox_vpc.sandbox_back_end_sg_id
  instance_name = local.back_end_instance_name
  access_key = aws_key_pair.sandbox_key_pair.key_name
}