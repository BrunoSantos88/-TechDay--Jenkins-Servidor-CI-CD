resource "aws_eks_cluster" "eks_cluster" {
  name     = "Eks-cluster"
  role_arn =  "${aws_iam_role.iam-role-eks-cluster.arn}"
  version  = "1.23"
 # Configure EKS with vpc and network settings 
  vpc_config {            
   security_group_ids = ["${aws_security_group.sg-networking.id}"]
# Configure subnets below
   subnet_ids         = [aws_subnet.subnet_public_1a.id,aws_subnet.subnet_public_1b.id,aws_subnet.subnet_public_1c.id]
    }
  depends_on = [
    "aws_iam_role_policy_attachment.eks-cluster-AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.eks-cluster-AmazonEKSServicePolicy",
   ]

   tags = {
    Name = "NodeMaster"
  }
}
 