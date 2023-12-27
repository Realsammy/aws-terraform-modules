
// CLUSTER ---------------------------

resource "aws_eks_cluster" "myCluster" {
  name     = var.cluster-name
  role_arn = aws_iam_role.myClusterRole.arn

  vpc_config {
    subnet_ids = aws_subnet.public-subnets[*].id 
  }

  depends_on = [
    aws_iam_role_policy_attachment.aws-provided-policy-basic,
    aws_iam_role_policy_attachment.aws-provided-policy-vpc-controlller,
  ]

}


// EKS Node Group ------------------------

resource "aws_eks_node_group" "myNodeGroup" {
  cluster_name    = aws_eks_cluster.myCluster.name
  node_group_name = "${aws_eks_cluster.myCluster.name}-node-group"
  node_role_arn   = aws_iam_role.myNodeGroup-role.arn 
  subnet_ids      =  aws_subnet.public-subnets[*].id 
  instance_types = var.instance-types

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  update_config {
    max_unavailable = var.max_unaval
  }


  depends_on = [
    aws_iam_role_policy_attachment.aws-provided-policy-ecr-readonly,
    aws_iam_role_policy_attachment.aws-provided-policy-cni-policy,
    aws_iam_role_policy_attachment.aws-provided-policy-vpc-controlller-workerNodePolicy,
  ]
}
