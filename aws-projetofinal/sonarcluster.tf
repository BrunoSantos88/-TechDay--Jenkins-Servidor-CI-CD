resource "aws_ecs_cluster" "sonarquebe" {
  name = "sonarquebe"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}