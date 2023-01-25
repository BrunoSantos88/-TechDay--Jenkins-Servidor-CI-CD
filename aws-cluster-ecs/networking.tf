resource "aws_default_vpc" "my-personal-web" {
  provider = aws.us-east-1

  tags = {
    env = "dev"
  }
}

resource "aws_default_subnet" "my-personal-web" {
  provider          = aws.us-east-1
  availability_zone = "us-east-1a"

  tags = {
    env = "dev"
  }
}

resource "aws_default_subnet" "my-personal-web-1" {
  provider          = aws.us-east-1
  availability_zone = "us-east-1b"


  tags = {
    env = "dev"
  }
}

resource "aws_security_group" "my-personal-web" {
  provider = aws.us-east-1

  name        = "allow_http"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_default_vpc.my-personal-web.id

  ingress {
    description = "Allow HTTP for all"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}