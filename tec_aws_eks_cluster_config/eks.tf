# Create the EKS cluster - Configures the Kubernetes control plane and integrates it with the VPC
resource "aws_eks_cluster" "tec_cluster" {
    name     = var.cluster_name
    role_arn = aws_iam_role.tec_cluster_role.arn

    vpc_config {
        subnet_ids         = aws_subnet.tec_cluster_subnet[*].id
        security_group_ids = [aws_security_group.tec_cluster_sg.id]
    }

    tags = {
        Name = var.cluster_name
    }
}

# Create Node Group - Defines the worker nodes that will run the Kubernetes workloads
resource "aws_eks_node_group" "tec_cluster_node_grp" {
    cluster_name    = aws_eks_cluster.tec_cluster.name
    node_group_name = "${var.cluster_name}-node-grp"
    node_role_arn   = aws_iam_role.tec_cluster_node_grp_role.arn
    subnet_ids      = aws_subnet.tec_cluster_subnet[*].id

    scaling_config {
        desired_size = var.desired_capacity
        max_size     = var.max_capacity
        min_size     =  var.min_capacity
    }

    instance_types =  [var.node_group_instance_type]

    remote_access {
        ec2_ssh_key = var.ssh_key_name
        source_security_group_ids = [aws_security_group.tec_cluster_node_sg.id]
    }

    tags = {
        Name = "${var.cluster_name}-node-grp"
    }
}