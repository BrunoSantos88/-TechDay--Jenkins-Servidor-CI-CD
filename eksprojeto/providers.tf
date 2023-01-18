terraform {
  required_providers {
    aws = {
        version = "1.3.7"
    }
    helm = {
        version = "2.6.0"
    }
    kubernetes = {
        version = "2.12.1"
    }
  }
}

provider "helm" {
    kubernetes {
        host                   = aws_eks_cluster.example.endpoint
        cluster_ca_certificate = base64decode(aws_eks_cluster.example.certificate_authority[0].data)
            exec {
                api_version = "client.authentication.k8s.io/v1beta1"
                args        = ["eks", "get-token", "--cluster-name",aws_eks_cluster.example.name]
                command     = "aws"
            }
    }
}

provider "kubernetes" {
    host                   = data.aws_eks_cluster.dev-cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.dev-cluster.certificate_authority.0.data)
    token                  = data.aws_eks_cluster_auth.dev-cluster.token
    #load_config_file       = false
}

provider "aws" {
    region = var.aws_region
}