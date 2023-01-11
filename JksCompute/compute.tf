resource "aws_instance" "jks" {
  count                       = 1
  image_id                    = "ami-0b5eea76982371e91"
  instance_type               = var.web_instance_type
  availability_zone           = "us-east-1a"
  subnet_id                   = var.public_subnet.id
  associate_public_ip_address = true
  key_name                    = "minhaaws"


  vpc_security_group_ids = [
   var.jks-sg.id
  ]

  root_block_device {
    delete_on_termination = true
    volume_size           = 50
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

 user_data = filebase64("Scripts/jenkis-amz.sh")
}
