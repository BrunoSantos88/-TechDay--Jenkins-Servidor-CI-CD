terraform {
  required_providers {

    terraform = {
    version = "1.3.7"
    }

    aws = {
        version = "4.50.0"
    }
  }
}

provider "aws" {
    region = var.aws_region
}