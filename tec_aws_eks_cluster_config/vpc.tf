# Create a vpc with cidr block
resource "aws_vpc" "tec_cluster_vpc" {
    cidr_block =  var.vpc_cidr

    tags = {
        Name        = "${var.cluster_name}-vpc"
        Terraform   = "true"
        Environment = "tec-dev-workload"
    }
}

#  create cluster vpc subnet
resource "aws_subnet" "tec_cluster_subnet" {
    count = 2
    vpc_id                  = aws_vpc.tec_cluster_vpc.id
    cidr_block              = cidrsubnet(aws_vpc.tec_cluster_vpc.cidr_block, 4, count.index)
    availability_zone       = element(["eu-west-2a", "eu-west-2b"], count.index)
    map_public_ip_on_launch = true

    tags = {
        Name = "tec-cluster-subnet-${count.index}"
    }
}

# Create an internet gateway
resource "aws_internet_gateway" "tec_cluster_igw" {
    vpc_id = aws_vpc.devopsshack_vpc.id

    tags = {
        Name = "tec-cluster-igw"
    }
}

# Create a routable
resource "aws_route_table" "tec_cluster_route_table" {
    vpc_id = aws_vpc.tec_cluster_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.tec_cluster_igw.id
    }

    tags = {
        Name = "tec-cluster-route-table"
    }
}

# Create and associate routable
resource "aws_route_table_association" "tec_cluster_rta" {
    count          = 2
    subnet_id      = aws_subnet.tec_cluster_subnet[count.index].id
    route_table_id = aws_route_table.tec_cluster_route_table.id
}
