terraform {
    required_version = "1.3.7"
}

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}