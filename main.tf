module "networking" {
  source       = "./-Terraform/networking"
  vpc_cidr     = "172.0.0.0/16"
  public_cidrs = ["172.0.1.0/24"]
}

module "networking" {
  source       = "./-Terraform/compute"
  
}