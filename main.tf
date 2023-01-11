module "networking" {
  source       = "./networking"
  vpc_cidr     = "172.0.0.0/16"
  public_cidrs = ["172.0.1.0/24"]
}

module "compute" {
  source       = "./compute"
  
}