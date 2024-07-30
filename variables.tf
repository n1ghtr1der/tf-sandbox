variable "vpc_cidr_block" {
    description = "VPC CIDR Block eg. 10.0.0.0/16, 172.16.0.0/16, 192.168.0.0/16"
    type = string
}

variable "vpc_name" {
    description = "VPC Name"
    type = string
}

variable "vpc_owner" {
    description = "VPC Owner Team"
    type = string
}