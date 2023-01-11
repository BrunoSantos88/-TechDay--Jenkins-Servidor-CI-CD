output "vpc_id" {
  value = aws_vpc.jks_vpc.id
}

output "jks-sg" {
  value = aws_security_group.jks-sg.id
}