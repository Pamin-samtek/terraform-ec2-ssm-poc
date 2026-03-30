output "vpc_id" {
  description = "VPC ID"
  value       = module.network.vpc_id
}

output "public_subnet_id" {
  description = "Public subnet ID"
  value       = module.network.public_subnet_id
}

output "security_group_id" {
  description = "Security group ID"
  value       = module.network.security_group_id
}

output "iam_role_name" {
  description = "IAM role name attached to EC2"
  value       = module.iam.role_name
}

output "instance_profile_name" {
  description = "IAM instance profile name"
  value       = module.iam.instance_profile_name
}

output "ec2_instance_id" {
  description = "EC2 instance ID"
  value       = module.ec2.instance_id
}

output "ec2_public_ip" {
  description = "EC2 public IP"
  value       = module.ec2.public_ip
}

output "ec2_private_ip" {
  description = "EC2 private IP"
  value       = module.ec2.private_ip
}

output "ec2_name" {
  description = "EC2 name tag"
  value       = module.ec2.instance_name
}

