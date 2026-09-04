provider "aws" {
  region = "ap-south-1"
}


module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr    = var.vpc_cidr
  environment = var.environment
}


module "iam" {
  source = "../../modules/iam"

  environment = var.environment
}


module "eks" {
  source = "../../modules/eks"

  environment = var.environment

  subnet_ids = module.vpc.private_subnet_ids

  cluster_role_arn = module.iam.cluster_role_arn

  node_role_arn = module.iam.node_role_arn

  node_count = var.eks_node_count

  node_min_size = var.eks_node_min_size

  node_max_size = var.eks_node_max_size

  instance_type = var.eks_instance_type

  root_volume_size = var.eks_root_volume_size
}


module "s3" {
  source = "../../modules/s3"

  environment   = var.environment
  bucket_suffix = "001"
}