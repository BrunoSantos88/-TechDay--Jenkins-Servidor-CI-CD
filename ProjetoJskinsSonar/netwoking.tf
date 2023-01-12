resource "aws_vpc" "jks_vpc" {
  cidr_block            = "172.0.0.0/16"

  enable_dns_hostnames  = true
  enable_dns_support    = true

  tags = {
    Name = "jks-networking"
  }
}


resource "aws_subnet" "jks_subnet_public_1a" {

  vpc_id                  = aws_vpc.jks_vpc.id
  cidr_block              = "172.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "jks-networking-a"
  }

}

resource "aws_subnet" "jks_subnet_public_1b" {
  vpc_id                  = aws_vpc.jks_vpc.id
  cidr_block              = "172.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "jks-networking-b"
  }

}

resource "aws_route_table_association" "jks_public_rt_association_1a" {
  subnet_id      = aws_subnet.jks_subnet_public_1a.id
  route_table_id = aws_route_table.jks_public_rt.id
}

resource "aws_route_table_association" "jks_public_rt_association_1b" {
  subnet_id      = aws_subnet.jks_subnet_public_1b.id
  route_table_id = aws_route_table.jks_public_rt.id
}

resource "aws_internet_gateway" "jks_ig" {
  vpc_id = aws_vpc.jks_vpc.id

  tags = {
    Name = "jks-igw"
  }

}

resource "aws_route_table" "jks_public_rt" {
  vpc_id = aws_vpc.jks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.jks_ig.id
  }

  tags = {
    Name = "jks-route-tables"
  }

}


###RedeBancoDeDados

resource "aws_db_subnet_group" "networkingdb" {
  name       = "networkingDB"
  subnet_ids = [aws_subnet.jks_subnet_public_1a.id,aws_subnet.jks_subnet_public_1b.id]

  tags = {
    Name        = "REDE-SUBNETS"
    Environment = "networkingDB"
    INFRA       = "SUBENTS_GROUP_ABC"
    Managed     = "IAC"
  }
}