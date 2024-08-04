

variable "project_name" {
  type = string
}

variable "environment" {
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