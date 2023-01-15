resource "aws_vpc" "eks_vpc" {
  cidr_block            = "172.0.0.0/16"

  enable_dns_hostnames  = true
  enable_dns_support    = true

  tags = {
    Name = "eks-networking"
  }
}


###subnetes
resource "aws_subnet" "eks_subnet_public_1a" {

  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "172.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "eks-networking-a"
  }

}
resource "aws_subnet" "eks_subnet_public_1b" {

  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "172.0.2.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "eks-networking-b"
  }
}
resource "aws_subnet" "eks_subnet_public_1c" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "172.0.3.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "eks-networking-c"
  }

}


#routetable
resource "aws_route_table_association" "eks_public_rt_association_1a" {
  subnet_id      = aws_subnet.eks_subnet_public_1a.id
  route_table_id = aws_route_table.eks_public_rt.id
}

resource "aws_route_table_association" "eks_public_rt_association_1b" {
  subnet_id      = aws_subnet.eks_subnet_public_1b.id
  route_table_id = aws_route_table.eks_public_rt.id
}
resource "aws_route_table_association" "eks_public_rt_association_1c" {
  subnet_id      = aws_subnet.eks_subnet_public_1c.id
  route_table_id = aws_route_table.eks_public_rt.id
}


resource "aws_internet_gateway" "eks_ig" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = {
    Name = "eks-igw"
  }

}

resource "aws_route_table" "eks_public_rt" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_ig.id
  }

  tags = {
    Name = "eks-route-tables"
  }

}