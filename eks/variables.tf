variable "vpc_id" {
  type        = string
  description = "VPC ID for EKS cluster"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnets to associate with EKS"
}

variable "cluster_sg_id" {
  type        = string
  description = "Security Group ID for EKS control plane"
}

variable "node_sg_id" {
  type        = string
  description = "Security Group ID for worker nodes"
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
  description = "EC2 Key pair name for SSH access"
}
