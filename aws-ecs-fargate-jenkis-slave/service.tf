resource "aws_ecs_service" "service" {
  name              = "service"
  cluster           = aws_ecs_cluster.ping.id
  task_definition   = aws_ecs_task_definition.task.id
  desired_count     = 1
  launch_type       = "FARGATE"
  platform_version  = "LATEST"

  network_configuration {
    assign_public_ip  = true
    security_groups   = [aws_security_group.sg-networking.id]
    subnets           = [aws_subnet.subnet_public_1a.id,aws_subnet.subnet_public_1b.id,aws_subnet.subnet_public_1c.id]
  }
  
  }