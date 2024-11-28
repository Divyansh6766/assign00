# Data source for default VPC and subnets
data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# IAM Role for EKS Cluster with AdministratorAccess (All permissions)
resource "aws_iam_role" "eks_role" {
  name = "eks-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = { Service = "eks.amazonaws.com" },
      Action   = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "eks_policy_attachment" {
  role       = aws_iam_role.eks_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"  # Attach AdministratorAccess to give all permissions
}

# IAM Role for Worker Nodes with AdministratorAccess (All permissions)
resource "aws_iam_role" "ec2_role" {
  name = "eks-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = { Service = "ec2.amazonaws.com" },
      Action   = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ec2_policies" {
  count = 3
  role  = aws_iam_role.ec2_role.name
  policy_arn = [
    "arn:aws:iam::aws:policy/AdministratorAccess",  # Attach AdministratorAccess to worker nodes
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",  # EKS Worker Node Policy
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"  # Access ECR
  ][count.index]
}

# EKS Cluster
resource "aws_eks_cluster" "my_cluster" {
  name     = "my-kubernetes-cluster"
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = data.aws_subnets.default.ids
  }
}

# Node Group
resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = "my-node-group"
  node_role_arn   = aws_iam_role.ec2_role.arn
  subnet_ids      = data.aws_subnets.default.ids
  ami_type        = "AL2_x86_64"  # Ensure correct EKS-optimized AMI is used

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  # Additional configurations like instance types can be added here if needed
  instance_types = ["t3.medium"]  # Example instance type
}
te