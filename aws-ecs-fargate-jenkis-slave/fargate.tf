resource "aws_ecs_task_definition" "definition" {
  family                   = "task_definition_name"
  task_role_arn            = "${var.ecs_task_role}"
  execution_role_arn       = "${var.ecs_task_execution_role}"
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "1024"
  requires_compatibilities = ["FARGATE"]
  }