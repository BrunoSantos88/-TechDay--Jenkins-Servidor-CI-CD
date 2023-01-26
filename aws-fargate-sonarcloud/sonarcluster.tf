resource "aws_ecs_cluster" "sonar" {
  name = "sonar"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}