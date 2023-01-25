resource "aws_ecs_cluster" "my-personal-web" {
  provider = aws.us-east-1
  name     = "my-personal-web-api-cluster"
}

resource "aws_ecs_cluster_capacity_providers" "my-personal-web" {
  provider = aws.us-east-1

  cluster_name = aws_ecs_cluster.my-personal-web.name

  capacity_providers = ["FARGATE"]
}

resource "aws_ecs_task_definition" "my-personal-web" {
  provider = aws.us-east-1

  family                   = "service"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 2048
  container_definitions = jsonencode([
    {
      name      = "my-personal-web-api"
      image     = "nginx"
      cpu       = 1024
      memory    = 2048
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "my-personal-web" {
  provider = aws.us-east-1

  name            = "my-personal-web"
  cluster         = aws_ecs_cluster.my-personal-web.id
  task_definition = aws_ecs_task_definition.my-personal-web.arn
  desired_count   = 2
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = [aws_default_subnet.my-personal-web.id, aws_default_subnet.my-personal-web-1.id]
    security_groups  = [aws_security_group.my-personal-web.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.my-personal-web.arn
    container_name   = "my-personal-web-api"
    container_port   = 80
  }

  tags = {
    env = "dev"
  }
}