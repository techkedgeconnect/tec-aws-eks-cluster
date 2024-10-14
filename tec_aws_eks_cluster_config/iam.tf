# Create eks cluster role - Provides permissions for the Kubernetes control plane
resource "aws_iam_role" "tec_cluster_role" {
    name = "${var.cluster_name}-eks-cluster-role"

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Principal = {
                    Service = "eks.amazonaws.com"
                }
            }   
        ]
    })

    tags = {
        Name = "${var.cluster_name}-eks-cluster-role"
    }
}

# Create eks cluster policy attachment - for required iam policy to the AmazonEKSClusterPolicy
resource "aws_iam_role_policy_attachment" "tec_cluster_role_policy" {
    role       = aws_iam_role.tec_cluster_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

# Create eks nodes role - grants worker nodes the necessary permissions for interacting with the EKS cluster and accessing resources
resource "aws_iam_role" "tec_cluster_node_grp_role" {
    name = "${var.cluster_name}-eks-node-grp-role"

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Principal = {
                    Service = "ec2.amazonaws.com"
                }
            }
        ]
    })

    tags = {
        Name = "${var.cluster_name}-eks-node-grp-role"
    }
}

# Create eks node group policy attachment - for required iam policy to the AmazonEKSWorkerNodePolicy
resource "aws_iam_role_policy_attachment" "tec_cluster_node_grp_role_policy" {
    role       = aws_iam_role.tec_cluster_node_grp_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

# Create eks cni policy attachment - for required iam policy to the AmazonEKSCNIPolicy
resource "aws_iam_role_policy_attachment" "tec_cluster_node_grp_cni_policy" {
    role       = aws_iam_role.tec_cluster_node_grp_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

# Create eks container policy attachment - for required iam policy to the AmazonEC2ContainerRegistryPolicy
resource "aws_iam_role_policy_attachment" "tec_cluster_node_grp_registry_policy" {
    role       = aws_iam_role.tec_cluster_node_grp_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}