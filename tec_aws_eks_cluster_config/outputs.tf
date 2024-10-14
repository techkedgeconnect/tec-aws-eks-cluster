output "cluster_id" {
    description = "EKS cluster ID"
    value = aws_eks_cluster.tec_cluster.id
}

output "cluster_node_grp_id" {
    description = "Cluster Node Group ID"
    value = aws_eks_node_group.tec_cluster_node_grp.id
}

output "vpc_id" {
    description = "Cluster Workloads VPC ID"
    value = aws_vpc.tec_cluster_vpc.id
}

output "subnet_ids" {
    description = "Cluster Workloads VPC Subnets IDs"
    value = aws_subnet.tec_cluster_subnet[*].id
}

output "cluster_endpoint" {
    description = "EKS cluster endpoint"
    value       = aws_eks_cluster.tec_cluster.endpoint
}

output "cluster_name" {
    description = "EKS cluster name"
    value       = aws_eks_cluster.tec_cluster.name
}

output "node_grp_role_arn" {
    description = "IAM role ARN for the node group"
    value       = aws_iam_role.tec_cluster_node_grp_role.arn
}