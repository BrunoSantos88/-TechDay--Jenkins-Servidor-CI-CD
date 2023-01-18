module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.0.4"

  cluster_name    = "eks-server"
  cluster_version = "1.23"

  vpc_id     = aws_vpc.networking.id
  subnet_ids = aws_subnet.subnet_public_1a.id
  cluster_endpoint_public_access = true

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"

  }

  eks_managed_node_groups = {
    one = {
      name = "node-group-1"

      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 1
      desired_size = 1
    }

    two = {
      name = "node-group-2"

      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 1
      desired_size = 1
    }
  }
}