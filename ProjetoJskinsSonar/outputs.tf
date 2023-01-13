output "vpc_id" {
  value = aws_vpc.jks_vpc.id
}

output "security-group" {
  value = aws_security_group.jks-sg.id
}

output "subnet_db" {
  value = aws_db_subnet_group.net-dados.id
}


output "instance-jenkis" {
  value = aws_instance.jks.id
}

output "instance-sonar" {
  value = aws_instance.SonarQube.subnet_id
}


