output "vpc_id" {
  value = aws_vpc.jks_vpc.id
}

output "jks-sg" {
  value = aws_security_group.jks-sg.id
}

output "jks-sg" {
  value = aws_db_subnet_group.networkingdb.id
}


output "instance-jenkis" {
  value = aws_instance.jks.id
}

output "instance-sonar" {
  value = aws_instance.SonarQube.subnet_id
}
output "sec-group" {
  value = aws_security_group.jks-sg.id
}

