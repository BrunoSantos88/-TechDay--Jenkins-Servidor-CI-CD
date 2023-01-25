resource "aws_lb" "my-personal-web" {
  name               = "my-personal-web-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg-networking.id]
  subnets            = [aws_subnet.subnet_public_1a.id, aws_subnet.subnet_public_1b.id,aws_subnet.subnet_public_1c.id]
  tags = {
    env = "dev"
  }
}


resource "aws_lb_target_group" "my-personal-web" {
  name        = "tf-my-personal-web-lb-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.networking.id

resource "aws_lb_listener" "my-personal-web" {
  load_balancer_arn = aws_lb.my-personal-web.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my-personal-web.arn
  }
}
}