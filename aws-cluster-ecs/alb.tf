resource "aws_lb" "my-personal-web" {
  provider = aws.us-east-1

  name               = "my-personal-web-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.my-personal-web.id]
  subnets            = [aws_default_subnet.my-personal-web.id, aws_default_subnet.my-personal-web-1.id]
  tags = {
    env = "dev"
  }
}


resource "aws_lb_target_group" "my-personal-web" {
  provider = aws.us-east-1

  name        = "tf-my-personal-web-lb-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_default_vpc.my-personal-web.id
}

resource "aws_lb_listener" "my-personal-web" {
  provider = aws.us-east-1

  load_balancer_arn = aws_lb.my-personal-web.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my-personal-web.arn
  }
}