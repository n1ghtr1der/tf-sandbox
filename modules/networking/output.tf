output "vpc_id" {
  value = aws_vpc.this.id
}
output "public_subnets_ids" {
  value = aws_subnet.public[*].id
}
output "public_subnets_cidrs" {
  value = aws_subnet.public[*].cidr_block
}
output "private_subnets_ids" {
  value = aws_subnet.private[*].id
}
output "private_subnets_cidrs" {
  value = aws_subnet.private[*].cidr_block
}
output "database_subnets_ids" {
  value = aws_subnet.database[*].id
}
output "database_subnets_cidrs" {
  value = aws_subnet.database[*].cidr_block
}