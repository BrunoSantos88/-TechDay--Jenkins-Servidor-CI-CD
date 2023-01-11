variable "jks_instance_type" {
  type    = string
  default = "t2.large"
}

# --- comput/variables.tf ---

variable "jks_sg" {}
variable "public_subnet" {}