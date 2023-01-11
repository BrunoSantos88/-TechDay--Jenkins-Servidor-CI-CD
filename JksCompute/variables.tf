# --- comput/variables.tf ---

variable "jks-sg" {}
variable "public_subnet" {}



variable "web_instance_type" {
  type    = string
  default = "t2.large"
}
