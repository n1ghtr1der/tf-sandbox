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

variable "access_key" {
  type = string
}

variable "disk_size" {
  type = number
  default = 8
}

variable "ami_id" {
  type = string
}

variable "instance_security_group" {
  type = string
}

variable "instance_name" {
  type = string
}