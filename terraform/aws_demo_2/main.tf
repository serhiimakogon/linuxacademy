
module "vpc" {
  source = "./modules/main-vpc"

  project              = var.project
  vpc_cidr             = var.main_vpc_cidr
  public_subnet_cidrs  = var.main_public_subnet_cidrs
  private_subnet_cidrs = var.main_private_subnet_cidrs
  admin_cidr           = var.main_admin_cidr
}