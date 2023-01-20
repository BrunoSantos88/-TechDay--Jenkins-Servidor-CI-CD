resource "aws_ecs_task_definition" "definition" {
  family                   = "task_definition_name"
  task_role_arn            = aws_iam_role.ecs_task_role.id
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.id
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "1024"
  requires_compatibilities = ["FARGATE"]
  }