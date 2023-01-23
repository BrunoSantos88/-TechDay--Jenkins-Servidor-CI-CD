resource "aws_ecs_cluster" "main" {
  name = "jenkinslv-cluster"
}

resource "aws_ecs_service" "hello_world" {
  name            = "hello-world-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.hello_world.arn
  desired_count   = var.app_count
  launch_type     = "FARGATE"

  network_configuration {
    security_groups = [aws_security_group.hello_world_task.id]
    subnets         = [aws_subnet.subnet_public_1a.id,aws_subnet.subnet_public_1b.id,aws_subnet.subnet_public_1c.id]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.hello_world.id
    container_name   = "jenkinsslave"
    container_port   = 8080
  }

  depends_on = [aws_lb_listener.hello_world]
}