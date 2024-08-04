output "vpc_id" {
  value = aws_vpc.sandbox_vpc.id
}

output "sandbox_back_end_sg_id" {
  value = aws_security_group.sandbox_back_end_sg.id
}

output "sandbox_front_end_sg_id" {
  value = aws_security_group.sandbox_front_end_sg.id
}