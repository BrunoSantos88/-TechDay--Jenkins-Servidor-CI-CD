resource "aws_ecs_cluster" "ping" {
  name = "ping"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}