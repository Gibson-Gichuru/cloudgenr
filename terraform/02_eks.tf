module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.3"

  cluster_name    = "my-eks"
  # role_arn        = aws_iam_role.eks_cluster_admin.arn
#   cluster_version = "1.23"

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.public_subnets

  enable_irsa = true

  eks_managed_node_group_defaults = {
    instance_types = [var.instance_size]
    vpc_security_group_ids = [aws_security_group.eks.id]
    disk_size = 50
  }

  eks_managed_node_groups = {
    general = {
      desired_size = 1
      min_size     = 1
      max_size     = 10

      labels = {
        role = "general"
      }

      instance_types = ["t3.small"]
      capacity_type  = "ON_DEMAND"
    }

    spot = {
      desired_size = 1
      min_size     = 1
      max_size     = 5

      labels = {
        role = "spot"
      }

      taints = [{
        key    = "market"
        value  = "spot"
        effect = "NO_SCHEDULE"
      }]

      instance_types = ["t3.micro"]
      capacity_type  = "SPOT"
    }
  }

  tags = {
    Environment = "dev"
  }
}

#eks cluster security group
resource "aws_security_group" "eks" {
  name        = "eks-security-group"
  description = "Security group for EKS cluster"
   vpc_id      = module.vpc.vpc_id

  # Add the necessary ingress and egress rules as per your requirements
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}