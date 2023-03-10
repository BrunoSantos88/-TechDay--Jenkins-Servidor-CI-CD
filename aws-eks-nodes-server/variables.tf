# --- comput/variables.tf ---
variable "jenks_instance_type" {
  type    = string
  default = "t2.large"
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
 ##Amazonlinux2 'us-east-1'
variable "amazonlinux2" {
  type    = string
  default = "ami-0b93ce03dcbcb10f6"
}

 ##ubuntu 'us-east-1'
variable "ubuntu2004" {
  type    = string
  default = "ami-0b93ce03dcbcb10f6"
}

#Servidores
variable "jenkinsServer" {
  type    = string
  default = "Jenkins*Server"
}


#networgin

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

variable "rds_instance_type" {
  type    = string
  default = "db.t3.micro"
}

variable "region-a" {
  type    = string
  default = "us-east-1a"
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