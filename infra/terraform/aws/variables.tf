variable "region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
  default     = "claude-template"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
  default     = "10.10.0.0/16"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public subnet CIDRs"
  default     = ["10.10.0.0/24", "10.10.1.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private subnet CIDRs"
  default     = ["10.10.10.0/24", "10.10.11.0/24"]
}

variable "node_instance_types" {
  type        = list(string)
  description = "EKS node instance types"
  default     = ["t3.medium"]
}

variable "desired_nodes" {
  type        = number
  description = "Desired node count"
  default     = 2
}
