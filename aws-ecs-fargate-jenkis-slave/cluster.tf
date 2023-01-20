resource "aws_ecs_cluster" "jenkslvn" {
  name = "jenkins-slave"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}