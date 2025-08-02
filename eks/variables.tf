variable "subnet_ids" {
  type        = list(string)
  description = "Subnets for the EKS cluster"
}

variable "cluster_sg_id" {
  type        = string
  description = "Cluster security group ID"
}

variable "node_sg_id" {
  type        = string
  description = "Node security group ID"
}

variable "cluster_role_arn" {
  type        = string
  description = "IAM role ARN for EKS cluster"
}

variable "node_group_role_arn" {
  type        = string
  description = "IAM role ARN for EKS node group"
}

variable "ssh_key_name" {
  type        = string
  description = "SSH key name for worker nodes"
}
