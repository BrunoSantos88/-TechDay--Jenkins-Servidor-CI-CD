module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  for_each = {
    for keyx, valuex in var.eks_creation : keyx => valuex
    if valuex.create_cluster && var.enable_eks_cluster_creation_flag
  }
  cluster_name                    = each.value.cluster_name
  cluster_version                 = "1.22"
  vpc_id                          = module.vpc["${each.value.attach_to_vpc_name}"].vpc_id
  subnet_ids                      = module.vpc["${each.value.attach_to_vpc_name}"].private_subnets
  cluster_endpoint_public_access  = each.value.cluster_endpoint_public_access
  cluster_endpoint_private_access = each.value.cluster_endpoint_private_access
  cluster_enabled_log_types       = each.value.cluster_enabled_log_types
  # enable_irsa                   = each.value.enable_irsa
  cluster_addons = { for key, value in each.value.cluster_addons : key => value }
  create_kms_key = true
  cluster_encryption_config = [{
    resources = ["secrets"]
  }]
  eks_managed_node_group_defaults = {
    ami_type  = "AL2_x86_64"
    disk_size = 20
    vpc_security_group_ids = [aws_security_group.node_group_one[each.key].id]
    attach_cluster_primary_security_group = true
  }
  eks_managed_node_groups = {
    one = {
      name           = "node-group-1"
      instance_types = ["t2.small"]
      min_size       = 1
      max_size       = 3
      desired_size   = 1
      disk_size      = 30
      labels = {
        "node" = "node-group-1"
        "app"  = "testing"
      }
      block_device_mappings = {
      sdc = {
        device_name = "/dev/sdc"
        ebs = {
          volume_size           = 50
          volume_type           = "gp2"
          encrypted             = true
          kms_key_id            = aws_kms_key.eks.arn
          delete_on_termination = false
        }
      }
    }
      disk_size = 30
      pre_bootstrap_user_data = <<-EOT
      echo 'DevOps- Because Developers Need Heroes'
      EOT
    }
    two = {
      name           = "node-group-2"
      instance_types = ["t2.small"]
      min_size       = 1
      max_size       = 2
      desired_size   = 1
      disk_size      = 30
      labels = {
        "node" = "node-group-2"
        "app"  = "testing"
      }
      pre_bootstrap_user_data = <<-EOT
      echo 'foo bar'
      EOT
      taints  = [{
        key = "dedicated"
        value  = "testing"
        effect = "NO_SCHEDULE"
      }]
    }
  }
}