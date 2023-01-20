resource "aws_ecs_cluster" "jenkins-slave" {
  name = "ping"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}