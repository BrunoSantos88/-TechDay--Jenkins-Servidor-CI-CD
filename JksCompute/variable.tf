variable "web_instance_type" {
  type    = string
  default = "t2.large"
}

# --- comput/variables.tf ---

variable "web_sg" {}
variable "public_subnet" {}