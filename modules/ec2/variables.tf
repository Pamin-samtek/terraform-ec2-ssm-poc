variable "project_name" {
  description = "Project name prefix"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "instance_name" {
  description = "EC2 instance name"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where EC2 will be deployed"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID for EC2"
  type        = string
}

variable "iam_instance_profile" {
  description = "IAM instance profile name for EC2"
  type        = string
}

