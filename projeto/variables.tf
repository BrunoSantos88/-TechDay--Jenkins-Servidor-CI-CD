# --- comput/variables.tf ---
variable "Jenkis_instance_type" {
  type    = string
  default = "t2.large"
}

variable "monitoring_instance_type" {
  type    = string
  default = "t2.large"
}
