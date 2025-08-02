module "vpc" {
  source   = "./vpc"
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "akshay-vpc"
}

module "subnets" {
  source             = "./subnets"
  vpc_id             = module.vpc.vpc_id
  route_table_id     = module.vpc.route_table_id
  subnet_cidrs       = ["10.0.1.0/24", "10.0.2.0/24"]
  azs                = ["us-east-1a", "us-east-1b"]
  subnet_name_prefix = "akshay-subnet"
}

module "security_groups" {
  source = "./security_groups"
  vpc_id = module.vpc.vpc_id
}

module "iam" {
  source = "./iam"
}

module "eks" {
  source              = "./eks"
  subnet_ids          = module.subnets.subnet_ids
  cluster_sg_id       = module.security_groups.cluster_sg_id
  node_sg_id          = module.security_groups.node_sg_id
  cluster_role_arn    = module.iam.cluster_role_arn
  node_group_role_arn = module.iam.node_group_role_arn
  ssh_key_name        = var.ssh_key_name
}
