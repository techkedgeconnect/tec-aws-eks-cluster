# Create EKS cluster security group - Allows traffic for the Kubernetes control plane
resource "aws_security_group" "tec_cluster_sg" {
    vpc_id = aws_vpc.tec_cluster_vpc.id

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "tec-cluster-sg"
    }
}

# Create nodes security group - Allows traffic for worker nodes, including SSH access for management
resource "aws_security_group" "tec_cluster_node_sg" {
    vpc_id = aws_vpc.tec_cluster_vpc.id

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "tec-cluster-node-sg"
    }
}