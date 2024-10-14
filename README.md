# AWS EKS Cluster Creation Automation Using IAC - Terraform
  This Git repository contains Terraform configuration files for provisioning a production-ready Amazon EKS (Elastic Kubernetes Service) cluster on AWS. The repository is organized to facilitate modular and reusable infrastructure code, with each configuration file serving a specific purpose.

# File Structure
  - provider.tf - Configures the AWS provider settings, specifying the region and AWS credentials for Terraform to interact with the AWS environment.

  - eks.tf - Contains the configuration for creating the EKS cluster and associated node groups, including settings for cluster version, node instance
    types, and scaling parameters.

  - vpc.tf - Defines the Virtual Private Cloud (VPC) and its associated subnets, route tables, and networking configurations necessary for the EKS
    cluster to operate securely.

  - iam.tf - Manages IAM roles, policies, and service accounts required for the EKS cluster and associated services, ensuring proper access control.

  - sg.tf - Configures the security groups for controlling network traffic to and from the EKS cluster, including rules for inbound and outbound traffic.

  - variables.tf - Declares input variables to parameterize the Terraform configuration, allowing flexibility in specifying values like region, VPC 
    CIDR, or instance types.

  - outputs.tf - Defines the output values that provide useful information about the infrastructure after deployment, such as the EKS cluster's 
    endpoint, VPC ID, or node group details.

# Getting Started
  Clone the Repository by executing this command - git clone https://github.com/techkedgeconnect/tec-eks-terraform-configuration.git
  - cd tec-eks-terraform-configuration
  - Initialize terraform by executing this command - terraform init
  - Apply the configuration by executing this command - terraform apply

# Prerequisites
  - Terraform v1.0+
  - AWS CLI configured with the necessary credentials
  - An existing AWS account

# Features
  - High availability with multi-AZ deployment
  - Secure, private subnets for worker nodes
  - Infrastructure as code for reproducibility and version control

# Contribution
Contributions are welcome! Please feel free to submit issues or pull requests for improvements.