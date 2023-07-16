# resource "aws_security_group" "efs" {
#   name        = "${var.env} efs"
#   description = "Allow traffic"
#   vpc_id      = module.vpc.vpc_id

#   ingress {
#     description      = "nfs"
#     from_port        = 2049
#     to_port          = 2049
#     protocol         = "TCP"
#     cidr_blocks      = [module.vpc.vpc_cidr_block]
#   }
# }

# resource "aws_efs_file_system" "kube" {
#   creation_token = "eks-efs"
# }

# resource "aws_efs_mount_target" "mount" {
#     file_system_id = aws_efs_file_system.kube.id
#     subnet_id = each.key
#     for_each = toset(module.vpc.private_subnets )
#     security_groups = [aws_security_group.efs.id]
# }

#efs secuity group creation
resource "aws_security_group" "efs" {
  name        = "efs-sg"
  description = "Allow traffic to efs"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "nfs"
    from_port        = 2049
    to_port          = 2049
    protocol         = "TCP"
    cidr_blocks      = [module.vpc.vpc_cidr_block]
  }
}

#EFS creation
resource "aws_efs_file_system" "kube" {
  creation_token = "eks-efs"
}

resource "aws_efs_mount_target" "mount" {
     file_system_id = aws_efs_file_system.kube.id
     for_each        = { for idx, subnet in module.vpc.private_subnets : idx => subnet }
     subnet_id       = each.value
     security_groups = [aws_security_group.efs.id]
}