module "networking" {
  source       = "./JksNetworking"
  vpc_cidr     = "172.0.0.0/16"
  public_cidrs = ["172.0.1.0/24","172.0.2.0/24"]
}

#module "Computing" {
#  source       = "./JksCompute"
  
#}