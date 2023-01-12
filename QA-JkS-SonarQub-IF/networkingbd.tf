resource "aws_db_subnet_group" "QualidadeNetworking" {
  name       = "group-subenets-publicas"
  subnet_ids = [aws_subnet.jks_subnet_public_1a.id,aws_subnet.jks_subnet_public_1b.id]

  tags = {
    Name        = "REDE-SUBNETS"
    Environment = "networkingDB"
    INFRA       = "SUBENTS_GROUP_ABC"
    Managed     = "IAC"
  }
}