# --- compute/main.tf ---

data "aws_ami" "linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}


resource "aws_launch_template" "web" {
  name_prefix            = "jenkins-server"
  image_id               = data.aws_ami.linux.id
  instance_type          = var.web_instance_type
  vpc_security_group_ids = [var.jks_sg]
  user_data              = filebase64("Scripts/jenkis-amz.sh")

  tags = {
    Name = "jenkins-server"
  }
}