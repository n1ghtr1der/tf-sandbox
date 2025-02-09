# === General ===
variable "project_name" {
  type = string
  description = "Project Name"
}
variable "tags" {
  type = map(string)
  description = "Tags"
}
# === VPC ===
variable "vpc_cidr" {
  type = string
  description = "VPC CIDR"
}
variable "vpc_name" {
  type = string
  description = "VPC Name"
}
# === Subnets ===
variable "public_subnets_cidrs" {
  type = list(string)
  description = "Public Subnet CIDRs"
}
variable "private_subnets_cidrs" {
  type = list(string)
  description = "Private Subnet CIDRs"
}
variable "database_subnets_cidrs" {
  type = list(string)
  description = "Database Subnet CIDRs"
}
variable "availability_zones" {
  type = list(string)
  description = "VPC Availability Zones"
}
