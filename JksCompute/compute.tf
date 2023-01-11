resource "aws_instance" "jks" {
  count                       = 1
  image_id                    = "ami-0b5eea76982371e91"  #mazonlinuz2
  instance_type               = var.web_instance_type  #T2 LARGE
  availability_zone           = "us-east-1a"
  subnet_id                   = "subnet-0e4576d780689e0b9"
  associate_public_ip_address = true
  key_name                    = "minhaaws"  #CHAVE SSH


  vpc_security_group_ids = [    ## portas 80, 8081, 22
   "sg-03537595b6c97fa4a"
  ]

  root_block_device {
    delete_on_termination = true
    volume_size           = 50  #SSD
    volume_type           = "gp2"


    tags = {
      Name = "jenkis_Sever"
    }
  }

  tags = {
    Name        = "jenkins*Server"
    Environment = "Treinamento"
    OS          = "AMAZONLINUX2"
    Managed     = "IAC"
  }

 user_data = filebase64("Scripts/jenkis-amz.sh")  ##SHELLSCRIPT
}
