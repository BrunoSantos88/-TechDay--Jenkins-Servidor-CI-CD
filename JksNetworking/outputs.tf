# --- networking/outputs.tf ---

output "vpc_id" {
  value = aws_vpc.jenkins_vpc.id
}

output "web_sg" {
  value = aws_security_group.web_sg.id
}

output "public_subnet" {
  value = aws_subnet.jenkins_subnet_public
}