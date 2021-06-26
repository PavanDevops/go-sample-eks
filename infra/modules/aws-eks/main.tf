data "aws_caller_identity" "current" {}

locals {
  env_map = {
    development = "dev"
    staging     = "stage"
    production  = "prod"
  }[var.environment]
  resource_name = "${local.env_map}-${var.project}"
}

resource "aws_eks_cluster" "eks" {
  name = local.resource_name
  role_arn = aws_iam_role.eks.arn
  vpc_config {
    subnet_ids = var.subnet_ids
  }
  depends_on = [
    aws_iam_role_policy_attachment.eks-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks-AmazonEKSVPCResourceController,
    aws_cloudwatch_log_group.eks
  ]
}

resource "aws_cloudwatch_log_group" "eks" {
  name              = "/aws/eks/${local.resource_name}/cluster"
  retention_in_days = 7
}


resource "aws_ecr_repository" "go" {
  name  = "go-sample"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = var.tag_map
}

resource "aws_ecr_repository" "pg" {
  name  = "pg-sample"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = var.tag_map
}