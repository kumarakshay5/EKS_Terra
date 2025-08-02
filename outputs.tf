output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_ids" {
  value = module.subnets.subnet_ids
}

output "route_table_id" {
  value = module.vpc.route_table_id
}

output "cluster_id" {
  value = module.eks.cluster_id
}

output "node_group_id" {
  value = module.eks.node_group_id
}
