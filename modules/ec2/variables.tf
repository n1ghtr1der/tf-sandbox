#General
variable "aws_region" {
  type = string
  default = "us-east-1"
}

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

#EC2
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
  default = "ami-0103953a003440c37"
}

variable "key_pair_pub_key" {
  type = string
}

#Network
variable "vpc_cidr_block" {
  type = string
  default = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  type = string
  default = "10.0.0.0/24"  
}