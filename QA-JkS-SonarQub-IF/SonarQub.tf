resource "aws_instance" "SonarQube" {
  ami                         = "ami-0b5eea76982371e91"  #mazonlinuz2
  instance_type               = var.web_instance_type  #T2 LARGE
  availability_zone           = "us-east-1b"
  subnet_id                   = aws_subnet.jks_subnet_public_1b.id
  associate_public_ip_address = true
  key_name                    = "minhaaws"  #CHAVE SSH


  vpc_security_group_ids = [    ## portas 80, 8081, 22
   aws_security_group.jks-sg.id
  ]

  root_block_device {
    delete_on_termination = true
    volume_size           = 50  #SSD
    volume_type           = "gp2"


    tags = {
      Name = "SonarQube_Sever"
    }
  }

  tags = {
    Name        = "SonarQube*Server"
    Environment = "Treinamento"
    OS          = "AMAZONLINUX2"
    Managed     = "IAC"
  }

 user_data = filebase64("Scripts/sonaqub.sh")  ##SHELLSCRIPT
}
