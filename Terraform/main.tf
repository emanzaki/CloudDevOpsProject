module "network" {
  source = "./modules/network"
  vpc_cidr = var.vpc_cidr
  mytag = var.mytag
  public_subnet_cidrs = var.public_subnet_cidrs
  aws_region = var.aws_region
  
}
