# === General ===
variable "project_name" {
  type = string
  description = "Project Name"
}
variable "tags" {
  type = map(string)
  description = "Tags"
}
variable "env_name" {
  type = string
  description = "environment"
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
variable "cidr_whitelist" {
  type = list(string)
  description = "Whitelist CIDRs"
}
variable "vpc_peering" {
  type = object({
    cidr = string
    connection_id = string
  })
  description = "VPC Peering"
  default = null
}