#General
variable "aws_region" {
  type = string
  description = "AWS Region to deploy"
}

variable "environment" {
  type = string
}

variable "project_name" {
  type = string
}

#Network
variable "vpc_cidr_block" {
  type = string
  default = "10.0.0.0/16"
}

variable "subnet_cidr_blocks" {
  type = list(string)  
}

variable "availability_zone" {
  type = list(string)
}

#EC2 Instances
variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "access_key_name" {
  type = string
  default = "dev-key"
}

variable "front_end_disk_size" {
  type = number
  default = 8
}

variable "back_end_disk_size" {
  type = number
  default = 8
}

variable "ami_id" {
  type = string
}

variable "key_pair_pub_key" {
  type = string
}

#ECR
variable "encryption_type" {
  type = string
}