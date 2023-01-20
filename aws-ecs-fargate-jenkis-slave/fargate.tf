resource "aws_ecs_task_definition" "jkstask" {
  family                        = "jsslave"
  network_mode                  = "awsvpc"
  requires_compatibilities      = ["FARGATE", "EC2"]
  cpu                           = 1024
  memory                        = 3072
  container_definitions         = jsonencode([
    {
      name      = "jenkins-slave"
      image     = "brunosantos88/jenkins-slave:latest"
      cpu       = 1024
      memory    = 3072
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