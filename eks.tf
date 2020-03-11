# cluster name needs to be unique, so randomize some chars
resource "random_string" "suffix" {
  length  = 8
  special = false
}

# Build a cluster name
locals {
  cluster_name = "cloudskiff-eks-${random_string.suffix.result}"
}

module "cluster-1" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "7.0.0"
  cluster_name    = local.cluster_name
  cluster_version = var.kubernetes_version
  manage_aws_auth = true

  # subnets = concat(module.vpc.public_subnets, module.vpc.private_subnets)
  subnets = module.vpc.private_subnets

  vpc_id = module.vpc.vpc_id

  # map_users = var.map_users

  # workers_additional_policies          = [aws_iam_policy.allow_ecr.arn]
  # worker_additional_security_group_ids = [aws_security_group.management.id]

  worker_groups = [
    {
      name                 = "1.14-wg-small"
      instance_type        = var.eks_worker_group_1_instance_type
      asg_max_size         = var.eks_asg_max_size
      asg_desired_capacity = var.eks_asg_desired_capacity
      asg_min_size         = var.eks_asg_min_size
    }
  ]
  tags = {
    environment = "production"
    Terraform   = "true"
    CloudSkiff  = "true"
  }

  workers_group_defaults = {
    key_name = aws_key_pair.admin.key_name
  }

  cluster_create_timeout = "30m"
}
