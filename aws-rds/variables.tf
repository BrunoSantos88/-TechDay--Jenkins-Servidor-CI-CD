# --- comput/variables.tf ---
variable "rds_instance_type" {
  type    = string
  default = "db.t3.micro"
}

variable "regions" {
  type    = string
  default = "us-east-1a"
}

###AMI
variable "key" {
  type    = string
  default = "minhaaws"
}

#networging
variable "vpc" {
  type    = string
  default = "Jenkins*Server"
}

variable "subenet-a" {
  type    = string
  default = "Jenkins*Server"
}

variable "subenet-b" {
  type    = string
  default = "Jenkins*Server"
}

variable "subenet-c" {
  type    = string
  default = "Jenkins*Server"
}

variable "security" {
  type    = string
  default = "Jenkins*Server"
}