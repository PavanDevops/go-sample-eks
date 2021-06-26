resource "aws_eks_node_group" "ng" {
  cluster_name = aws_eks_cluster.eks.name
  node_group_name = "${local.resource_name}-node-group"
  node_role_arn = aws_iam_role.eks.arn
  subnet_ids = var.subnet_ids

//  ami_type = ""
  instance_types = ["t2.medium"]
  disk_size = "20"
  remote_access {
    ec2_ssh_key = aws_key_pair.key.key_name
  }

  scaling_config {
    desired_size = 1
    max_size = 1
    min_size = 1
  }
  depends_on = [
    aws_iam_role_policy_attachment.ng-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.ng-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.ng-AmazonEC2ContainerRegistryReadOnly,
  ]
  tags = var.tag_map
}

resource "aws_key_pair" "key" {
  public_key = var.ssh_key
  key_name = var.project
}
