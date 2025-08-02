# Terraform AWS EKS Modular Setup

This project provisions an Amazon EKS (Elastic Kubernetes Service) cluster using a fully modular Terraform structure. It includes:

- **VPC** (Virtual Private Cloud)
- **Subnets** (Public subnets)
- **Security Groups** (Cluster and Node)
- **IAM Roles** (Cluster and Node Group roles with required policies)
- **EKS Cluster and Node Group**

---

## **Project Structure**
TERRA_EKS/
│── eks/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
│── iam/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
│── security_groups/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
│── subnets/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
│── vpc/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
│── main.tf
│── variables.tf
│── outputs.tf
│── provider.tf
└── README.md

---

## **Modules Overview**
1. **VPC Module**: Creates VPC, Internet Gateway, and Route Table.
2. **Subnets Module**: Creates public subnets and associates them with the route table.
3. **Security Groups Module**: Creates security groups for EKS Cluster and Nodes.
4. **IAM Module**: Creates IAM roles for Cluster and Node Groups with required AWS-managed policies.
5. **EKS Module**: Creates EKS Cluster and Managed Node Group.

---

## **Prerequisites**
- [Terraform >= 1.5](https://developer.hashicorp.com/terraform/downloads)
- AWS CLI configured with proper credentials
- SSH key pair created in AWS (default name: `DevOps`)
- S3 backend (optional) for remote state

---

## **How to Use**
1. **Initialize Terraform**

   terraform init

2. **Validate Configuration**

    terraform validate

3. **Plan the Deployment**

    terraform plan

4. **Apply the Deployment**

    terraform apply

Customizing Variables: 

You can modify variables in main.tf or via CLI:

Example:

module "eks" {
  source              = "./eks"
  subnet_ids          = module.subnets.subnet_ids
  cluster_sg_id       = module.security_groups.cluster_sg_id
  node_sg_id          = module.security_groups.node_sg_id
  cluster_role_arn    = module.iam.cluster_role_arn
  node_group_role_arn = module.iam.node_group_role_arn
  ssh_key_name        = "MyKeyPair"
}

Outputs :
After deployment, Terraform will output:

    vpc_id
    subnet_ids
    route_table_id
    cluster_id
    node_group_id

Destroying Resources
To clean up all resources:

    terraform destroy

Next Steps
Configure kubectl:

aws eks update-kubeconfig --name akshay-cluster --region us-east-1
Deploy workloads using Helm or Kubernetes manifests.

License
This project is licensed under the MIT License.

Do you want me to **add architecture diagram (VPC + EKS)** for the README, or keep it text-only? And should I **include example `terraform.tfvars`** for easy configuration?
