
module "vpc" {
  source               = "./modules/main-vpc"

  project              = var.project
  vpc_cidr             = var.main_vpc_cidr
  public_subnet_cidrs  = var.main_public_subnet_cidrs
  private_subnet_cidrs = var.main_private_subnet_cidrs
  admin_cidr           = var.main_admin_cidr
}

module "compute" {
  source               = "./modules/compute"

  project              = var.project
  instance_type        = var.instance_type
  key_pair_name        = var.key_pair_name
  vpc_id               = module.vpc.vpc_id
  admin_cidr           = var.main_admin_cidr
  vpc_zone_identifier  = module.vpc.subnet_public_ids
}