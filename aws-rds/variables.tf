# --- comput/variables.tf ---
variable "rds_instance_type" {
  type    = string
  default = "db.t3.micro"
}

variable "region-a" {
  type    = string
  default = "us-east-1a"
}

#networging
variable "vpc" {
  type    = string
  default = "Jenkins*Server"
}

variable "subnet-grups" {
  type    = string
  default = "group-subenets-publicas"
}

variable "login" {
  type    = string
  default = "admin"
}

variable "senha" {
  type    = string
  default = "sonarsonar"
}