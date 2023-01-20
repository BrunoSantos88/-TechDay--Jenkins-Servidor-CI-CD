resource "aws_ecs_task_definition" "task" {
  family                        = "service"
  network_mode                  = "awsvpc"
  requires_compatibilities      = ["FARGATE", "EC2"]
  cpu                           = 512
  memory                        = 2048
  container_definitions         = jsonencode([
    {
      name      = "jenkins-slave"
      image     = "brunosantos88/jenkins-slave:latest"
      cpu       = 512
      memory    = 2048
      essential = true  # if true and if fails, all other containers fail. Must have at least one essential
      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080
        }
      ]
    }
  ])
}