resource "aws_vpc" "eksnetworking" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "eksnetworing"
  }
}