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

module "sandbox_instance_front" {
  source = "./modules/ec2"
  project_name = var.project_name
  environment = var.environment
  instance_security_group = module.sandbox_vpc.sandbox_front_end_sg_id
  instance_name = local.front_end_instance_name
  access_key = aws_key_pair.sandbox_key_pair.key_name
  ami_id = var.ami_id
}

# module "sandbox_repository_front" {
#   source = "./modules/ecr"
#   registry_name = local.front_end_repository_name
#   encryption_type = var.encryption_type
# }

module "sandbox_instance_back" {
  source = "./modules/ec2"
  project_name = var.project_name
  environment = var.environment
  instance_security_group = module.sandbox_vpc.sandbox_back_end_sg_id
  instance_name = local.back_end_instance_name
  access_key = aws_key_pair.sandbox_key_pair.key_name
  ami_id = var.ami_id
}

# module "sandbox_repository_back" {
#   source = "./modules/ecr"
#   registry_name = local.back_end_repository_name
#   encryption_type = var.encryption_type
# }