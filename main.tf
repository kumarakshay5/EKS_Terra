module "vpc" {
  source       = "./modules/vpc"
  cidr_block   = var.vpc_cidr
  subnet_count = var.subnet_count
  azs          = var.azs
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}

module "iam" {
  source = "./modules/iam"
}

module "eks" {
  source              = "./modules/eks"
  subnet_ids          = module.vpc.subnet_ids
  cluster_sg_id       = module.security_groups.cluster_sg_id
  node_sg_id          = module.security_groups.node_sg_id
  cluster_role_arn    = module.iam.cluster_role_arn
  node_group_role_arn = module.iam.node_group_role_arn
  ssh_key_name        = var.ssh_key_name
  cluster_name        = var.cluster_name
  node_group_name     = var.node_group_name
  instance_types      = var.instance_types
  desired_size        = var.desired_size
  min_size            = var.min_size
  max_size            = var.max_size
}
