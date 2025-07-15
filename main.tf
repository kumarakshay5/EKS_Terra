module "vpc" {
  source = "./vpc"
}

module "subnets" {
  source         = "./subnets"
  vpc_id         = module.vpc.vpc_id
  route_table_id = module.vpc.route_table_id
}

module "security_groups" {
  source = "./security_groups"
  vpc_id = module.vpc.vpc_id
}

module "iam" {
  source = "./iam"
}

module "eks" {
  source                     = "./eks"
  vpc_id                     = module.vpc.vpc_id
  subnet_ids                 = module.subnets.subnet_ids
  cluster_sg_id              = module.security_groups.cluster_sg_id
  node_sg_id                 = module.security_groups.node_sg_id
  cluster_role_arn           = module.iam.cluster_role_arn
  node_group_role_arn        = module.iam.node_group_role_arn
  ssh_key_name               = var.ssh_key_name
}
