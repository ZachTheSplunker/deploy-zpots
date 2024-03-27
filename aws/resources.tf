module "networkModule" {
  source = "./modules/network"
  aws    = var.aws
}

module "zpot" {
  source                 = "./modules/zpot"
  debian_ami             = var.debian_ami
  aws                    = var.aws
  ec2_subnet_id          = module.networkModule.ec2_subnet_id
  vpc_security_group_ids = module.networkModule.sg_vpc_id
  zpot                   = var.zpot
}