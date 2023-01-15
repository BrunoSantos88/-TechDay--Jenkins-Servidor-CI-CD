resource "aws_instance" "kubernetesServer" {
  ami                         = "ami-0b93ce03dcbcb10f6"  #ubuntu 20:04
  instance_type               = var.k8s_instance_type  #T2 LARGE
  availability_zone           = "us-east-1a"
  subnet_id                   = aws_subnet.eks_subnet_public_1a.id
  associate_public_ip_address = true
  key_name                    = "minhaaws"  #CHAVE SSH


  vpc_security_group_ids = [    ## portas 80, 8081, 22
   aws_security_group.k8s-sg.id
  ]

  root_block_device {
    delete_on_termination = true
    volume_size           = 50  #SSD
    volume_type           = "gp2"


    tags = {
      Name = "Node*MasterK8Server"
    }
  }

  tags = {
    Name        = "Kubernetes*Server"
    Environment = "Treinamento"
    OS          = "ubuntu20.04"
    Managed     = "IAC"
  }

 user_data = filebase64("Kubenetes/k8Server.sh")  ##SHELLSCRIPT
}
