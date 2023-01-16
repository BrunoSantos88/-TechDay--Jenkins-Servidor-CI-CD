resource "aws_ecr_repository" "ecr_front" {
 name                 = var.ecr-front
 image_tag_mutability = "frontend"

 image_scanning_configuration {
   scan_on_push = true
 }
}