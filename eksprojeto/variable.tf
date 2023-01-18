# ------------------------------------------------------------
# Jenkins Settings
# ------------------------------------------------------------
variable "jenkins_admin_user" {
  type        = string
  description = "Admin user of the Jenkins Application."
  default     = "admin"
}

variable "jenkins_admin_password" {
  type        = string
  description = "Admin password of the Jenkins Application."
  default     = "adminadmin"
}

variable "aws_region" {
  type        = string
  description = "The AWS region for the provider to deploy resources into."
  default     = "us-east-1"
}