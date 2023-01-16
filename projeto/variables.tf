# --- comput/variables.tf ---
variable "monitoring_instance_type" {
  type    = string
  default = "t2.large"
}

variable "ecr-front" {
 description = "frontend"
 type = string
}

variable "ecr-back" {
 description = "backend"
 type = string
}

variable "region" {
 description = "us-east-1"
 type = string
}