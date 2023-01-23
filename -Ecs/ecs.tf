resource "aws_ecr_repository" "worker" {
    name  = "worker"
}

resource "aws_ecs_cluster" "ecs_cluster" {
    name  = "my-cluster"

[
  {
    "essential": true,
    "memory": 512,
    "name": "worker",
    "cpu": 2,
    "image": "${REPOSITORY_URL}:latest",
    "environment": []
  }
]

}

resource "aws_ecs_service" "worker" {
  name            = "worker"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.task_definition.arn
  desired_count   = 2
}