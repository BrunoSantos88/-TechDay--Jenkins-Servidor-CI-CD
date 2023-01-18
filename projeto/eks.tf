resource "aws_eks_cluster" "aws-eks" {
  name     = "aws-eks"
  vpc_config {
    subnet_ids = [aws_subnet.subnet_public_1c.id,aws_subnet.subnet_public_1a.id,aws_subnet.subnet_public_1b.id]
  }
  tags = {
    Name = "aws-eks"
  }
}
resource "aws_eks_node_group" "node1" {
  cluster_name    = aws_eks_cluster.aws-eks.name
  node_group_name = "eks-cluster"
  instance_types	  =["t2.medium"]
  subnet_ids      = [aws_subnet.subnet_public_1a.id]
  remote_access {
  ec2_ssh_key	  = "minhaaws"
source_security_group_ids = [aws_security_group.sg-networking.id]
  }
  disk_size		  =50
  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }
  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  
}
resource "aws_eks_node_group" "node2" {
  cluster_name    = aws_eks_cluster.aws-eks.name
  node_group_name = "ng-2"
  instance_types	  =["t2.medium"]
  subnet_ids      = [aws_subnet.subnet_public_1b.id]
  remote_access {
  ec2_ssh_key	  = "minhaaws"
source_security_group_ids = [aws_security_group.sg-networking.id]
  }
  disk_size		  =50
  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }
}
