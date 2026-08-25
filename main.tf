module "network" {
  source = "./modules/network"

  project_name       = var.project_name
  environment        = var.environment
  vpc_cidr           = var.vpc_cidr
  availability_zones = var.availability_zones
}

module "security" {
  source = "./modules/security"

  project_name = var.project_name
  environment  = var.environment
  vpc_id       = module.network.vpc_id
}

module "load_balancer" {
  source = "./modules/load_balancer"

  project_name      = var.project_name
  environment       = var.environment
  vpc_id            = module.network.vpc_id
  subnet_ids        = module.network.subnet_ids
  security_group_id = module.security.alb_security_group_id
}

module "web_tier" {
  source = "./modules/web_tier"

  project_name      = var.project_name
  environment       = var.environment
  subnet_ids        = module.network.subnet_ids
  security_group_id = module.security.web_security_group_id
  target_group_arn  = module.load_balancer.target_group_arn
}