variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  type        = string
}

variable "subnet_ids" {
  description = "Subnets for the EKS cluster and node group"
  type        = list(string)
}

variable "cluster_sg_id" {
  description = "Security Group ID for the EKS cluster"
  type        = string
}

variable "node_sg_id" {
  description = "Security Group ID for the worker nodes"
  type        = string
}

variable "cluster_role_arn" {
  description = "IAM Role ARN for the EKS cluster"
  type        = string
}

variable "node_group_role_arn" {
  description = "IAM Role ARN for the EKS node group"
  type        = string
}

variable "ssh_key_name" {
  description = "Name of the SSH key pair for worker nodes"
  type        = string
}

variable "instance_types" {
  description = "List of EC2 instance types for worker nodes"
  type        = list(string)
}

variable "desired_size" {
  description = "Desired number of worker nodes"
  type        = number
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
}
