# Cluster Execution Role
resource "aws_iam_role" "ecs_execution_role" {
  name               = "ecs_task_role"
  assume_role_policy = "${file("policies/ecs-task-execution-role.json")}"
}

# Cluster Execution Policy
resource "aws_iam_role_policy" "ecs_execution_role_policy" {
  name   = "role_policy"
  policy = "${file("policies/ecs-execution-role-policy.json")}"
  role   = "${aws_iam_role.ecs_execution_role.id}"
}

resource "aws_iam_role" "ecs_role" {
  name               = "ecs_role"
  assume_role_policy = "${data.aws_iam_policy_document.ecs_service_role.json}"
}

resource "aws_iam_role_policy" "ecs_service_role_policy" {
  name   = "role_policy"
  policy = "${data.aws_iam_policy_document.ecs_service_policy.json}"
  role   = "${aws_iam_role.ecs_role.id}"
}

# ECS Service Policy
data "aws_iam_policy_document" "ecs_service_policy" {
  statement {
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "elasticloadbalancing:Describe*",
      "elasticloadbalancing:DeregisterInstancesFromLoadBalancer",
      "elasticloadbalancing:RegisterInstancesWithLoadBalancer",
      "ec2:Describe*",
      "ec2:AuthorizeSecurityGroupIngress",
    ]
  }
}

# ECS Service Policy
data "aws_iam_policy_document" "ecs_service_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs.amazonaws.com"]
    }
  }
}
