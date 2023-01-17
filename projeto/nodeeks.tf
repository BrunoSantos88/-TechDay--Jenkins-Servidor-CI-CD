resource "aws_eks_node_group" "eks-pipeline" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "eks-pipeline"
  node_role_arn   = aws_iam_role.eks_nodes.arn
  subnet_ids      = [aws_subnet.subnet_public_1a.id,aws_subnet.subnet_public_1b.id,aws_subnet.subnet_public_1c.id]
  

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  ami_type       = "AL2_x86_64"
  instance_types = "t3.large"
  disk_size      = 50


  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]

    tags = {
    Environment = "Devops"
    Terraform   = "true"
  }
}

