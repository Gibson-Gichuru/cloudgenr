#creates AWS IAM role for user elcy
#EKS Cluster Policy & EKS Service policy (to manage resources)
resource "aws_iam_role" "eks_cluster_admin" {
  name = "eks-cluster-admin"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::120651511769:user/elcymao"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

#Attach maanged policy -permssiion to delete/create EKS cluster,managing node groups
resource "aws_iam_role_policy_attachment" "eks_cluster_admin_policy" {
  role       = aws_iam_role.eks_cluster_admin.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}