resource "aws_ecs_task_definition" "sonar" {
  family                        = "sonarquebe"
  network_mode                  = "awsvpc"
  requires_compatibilities      = ["FARGATE", "EC2"]
  cpu                           = 1024
  memory                        = 3072
  container_definitions         = jsonencode([
    {
      name      = "sonarquebe"
      image     = "brunosantos88/awssonarqube:latest"
      cpu       = 1024
      memory    = 3072
      essential = true  # if true and if fails, all other containers fail. Must have at least one essential
      portMappings = [
        {
          containerPort = 9000
          hostPort      = 900
        }
      ]
    }
  ])
}