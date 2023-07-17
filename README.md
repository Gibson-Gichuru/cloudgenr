# 7Ts
# Multi-Tier Application Deployment in EKS
## Summary:
Deploying a multi-tier application (WordPress) using EKS (Elastic Kubernetes Service),EFS (Elastic File System), RDS (Relational Database Service)
using Terrfaom and Helm.

To deploy a web app using EKS, you set up EKS Cluster.

To make the WordPress data and configuration persistent, you need persistent storage. (EFS for this step)

WordPress docker image

Relation Database as per the instructions.

## Prerequisites:
- Terraform installed
- Kubectl and minikube installed
- Installing Helm
- Lucid/Draw.io for the architectural diagram

## Architectural Diagram

## Terraform 
### Creating EKS Cluster and EFS Storage:

 - The [eks.tf](https://github.com/elsie-dev/7Ts/blob/main/terraform/02_eks.tf) uses EKS terraform module to define the EKS cluster by specifying configurations like region, and instance type.
 - you can also view the vpc.tf file which has vpc module that contains the appropriate networking settings, like VPC, subnets, security group, and role.

### Defining EFS File System
- The [efs.tf](https://github.com/elsie-dev/7Ts/blob/main/terraform/03_efs.tf) is used to store the data and configuration for the prroject permanently. 

Running terraform scripts:

```
Terraform init
```

```
Terraform plan --var-file=tfvar/dev.tfvars && Terraform apply --var-file=tfvar/dev.tfvars
```

**EFS provisioner** is created next, so that EFS Storage can be used by the resources in the EKS cluster.
To run the EFS provisioned ...............................
