output "ip" {
    value =  "$ {aws_db_instance.wordpress.address}"
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}