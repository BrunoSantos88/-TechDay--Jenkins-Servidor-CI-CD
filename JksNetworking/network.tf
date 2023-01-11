resource "aws_vpc" "jenkins_vpc" {
  cidr_block            = var.vpc_cidr  

  enable_dns_hostnames  = true
  enable_dns_support    = true

  tags = {
    Name = "jenkins-network"
  }
}


resource "aws_subnet" "jenkins_subnet_public" {

  vpc_id                  = aws_vpc.jenkins_vpc.id
  cidr_block              = "172.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "jenkins-network"
  }

}

resource "aws_route_table_association" "jenkis_public_rt_association_1a" {
  subnet_id      = aws_vpc.jenkins_vpc.id
  route_table_id = aws_route_table.eks_public_rt.id
}


resource "aws_internet_gateway" "jks_ig" {
  vpc_id = aws_vpc.jenkins_vpc.id

  tags = {
    Name = "jeks-igw"
  }

}

resource "aws_route_table" "eks_public_rt" {
  vpc_id = aws_vpc.jenkins_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.jks_ig.id
  }

  tags = {
    Name = "jks-route-tables"
  }

}


resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow all inbound HTTP traffic"
  vpc_id      = aws_vpc.jenkins_vpc.id

  ingress {
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
