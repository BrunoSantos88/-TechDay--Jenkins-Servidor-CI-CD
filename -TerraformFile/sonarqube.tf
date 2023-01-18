resource "aws_instance" "sonarqube" {
  ami                         = "ami-0b93ce03dcbcb10f6"  #ubuntu 20:04
  instance_type               = var.jenks_instance_type  #T2 LARGE
  availability_zone           = "us-east-1a"
  subnet_id                   = aws_subnet.subnet_public_1b.id
  associate_public_ip_address = true
  key_name                    = "minhaaws"  #CHAVE SSH


  vpc_security_group_ids = [    ## portas 80, 8081, 22
   aws_security_group.sg-networking.id
  ]

  root_block_device {
    delete_on_termination = true
    volume_size           = 50  #SSD
    volume_type           = "gp2"


    tags = {
      Name = "Sonar_Sever"
    }
  }

  tags = {
    Name        = "Sonar*Server"
    Environment = "Treinamento"
    OS          = "ubuntu20:04"
    Managed     = "IAC"
  }

 user_data = filebase64("Scripts/sonaqub.sh")  ##SHELLSCRIPT
}