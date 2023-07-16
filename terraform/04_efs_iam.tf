# resource "aws_iam_policy" "node_efs_policy" {
#   name        = "eks_node_efs-${var.env}"
#   path        = "/"
#   description = "Policy for EFKS nodes to use EFS"

#   policy = jsonencode({
#     "Statement": [
#         {
#             "Action": [
#                 "elasticfilesystem:DescribeMountTargets",
#                 "elasticfilesystem:DescribeFileSystems",
#                 "elasticfilesystem:DescribeAccessPoints",
#                 "elasticfilesystem:CreateAccessPoint",
#                 "elasticfilesystem:DeleteAccessPoint",
#                 "ec2:DescribeAvailabilityZones"
#             ],
#             "Effect": "Allow",
#             "Resource": "*",
#             "Sid": ""
#         }
#     ],
#     "Version": "2012-10-17"
# }
#   )
# }