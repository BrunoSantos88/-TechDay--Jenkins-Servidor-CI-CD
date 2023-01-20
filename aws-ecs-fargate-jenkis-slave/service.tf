resource "aws_ecs_service" "jkslve" {
  name              = "jsnkislv"
  cluster           = aws_ecs_cluster.jenkslvn.id
  task_definition   = aws_ecs_task_definition.jkstask.id
  desired_count     = 1
  launch_type       = "FARGATE"
  platform_version  = "LATEST"

  network_configuration {
    assign_public_ip  = true
    security_groups   = [aws_security_group.sg-networking.id]
    subnets           = [aws_subnet.subnet_public_1a.id,aws_subnet.subnet_public_1b.id,aws_subnet.subnet_public_1c.id]
  }
  
  }