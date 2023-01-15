resource "aws_instance" "jks" {
  ami                         = "ami-0b5eea76982371e91"  #mazonlinuz2
  instance_type               = var.Jenkis_instance_type  #T2 LARGE
  availability_zone           = "us-east-1a"
  subnet_id                   = aws_subnet.jks_subnet_public_1a.id
  associate_public_ip_address = true
  key_name                    = "minhaaws"  #CHAVE SSH


  vpc_security_group_ids = [    ## portas 80, 8081, 22
   aws_security_group.jks-sg.id
  ]

  tags = {
    Name        = "jenkins*Server"
    Environment = "Treinamento"
    OS          = "AMAZONLINUX2"
    Managed     = "IAC"
  }

 user_data = filebase64("Scripts/jenkis-amz.sh")  ##SHELLSCRIPT
}