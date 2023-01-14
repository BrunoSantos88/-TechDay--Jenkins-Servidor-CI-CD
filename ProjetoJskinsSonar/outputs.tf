output "vpc_id" {
  value = aws_vpc.jks_vpc.id
}

output "security-group" {
  value = aws_security_group.jks-sg.id
}


