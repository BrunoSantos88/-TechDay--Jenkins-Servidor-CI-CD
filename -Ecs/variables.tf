variable "aws_cloudwatch_retention_in_days" {
  type        = number
  description = "AWS CloudWatch Logs Retention in Days"
  default     = 1
}

variable "app_name" {
  type        = string
  description = "jenkins"
}

variable "app_environment" {
  type        = string
  description = "Application Environment"
}


variable "availability_zones" {
  description = "us-east-1"
}


