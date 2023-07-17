
# Multi-Tier Application Deployment in EKS
## Summary:
Deploying a multi-tier application (WordPress) using EKS (Elastic Kubernetes Service), EFS (Elastic File System), RDS (Relational Database Service)
using Terraform and Helm.

1. To deploy a web app using EKS, you set up EKS Cluster.

2. To make the WordPress data and configuration persistent, you need persistent storage. (EFS for this step)

3. WordPress docker image to simulate the WordPress application

4. Relation Database as per the instructions.

## Prerequisites:
- Terraform installed 
- Kubectl and Minikube installed
- Installing Helm on 
- Lucid/Draw.io for the architectural diagram

## Architectural Diagram

## Terraform Files and Setup

### Creating EKS Cluster and EFS Storage:

 - The [eks.tf](https://github.com/elsie-dev/7Ts/blob/main/terraform/02_eks.tf) uses EKS terraform module to define the EKS cluster by specifying configurations like region, and instance type.
 - You can also view the [vpc.tf](https://github.com/elsie-dev/7Ts/blob/main/terraform/01_vpc.tf) file which has vpc module that contains the appropriate networking settings, like VPC, subnets, security group, and role.

### Defining EFS File System
- The [efs. tf](https://github.com/elsie-dev/7Ts/blob/main/terraform/03_efs.tf) is used to store the data and configuration for the project permanently. 

**EFS provisioner** uses EFS Storage for creating resources in the EKS cluster.
To run the EFS provisioned ...............................
To use EFS Volume, you need a persistent volume claim, which is Kubernetes manifest file pvc.yaml.

### Provisioning the RDS Database

The RDS database instance is used by WordPress.

**Running terraform scripts:**

- Clone the repo
- Cd to the terraform folder
- Run ```terraform init```, this command initializes backend which is responsible for storing Terraform state.
- Tfvar allows to separate  sensitive values for my case, the environment tag from the main code. Not including it in the Terraform  plan and apply command generates an error
  
 ```
  terraform plan --var-file=tfvars/dev.tfvars &&  terraform apply --var-file=tfvars/dev.tfvars
 ```

## Setting up Helm

- Initialize Helm by running ``helm init``

-  Update the Helm repo by running ```helm repo update```

-  Create a Helm chart for WordPress, which defines the deployment and Kubernetes services needed to run WordPress.

- Using Helm to deploy the WordPress chart onto EKS cluster

## Challenges Faced:
- 

