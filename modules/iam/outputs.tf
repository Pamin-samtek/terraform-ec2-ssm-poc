output "role_name" {
  description = "IAM role name"
  value       = aws_iam_role.ssm_role.name
}

output "instance_profile_name" {
  description = "IAM instance profile name"
  value       = aws_iam_instance_profile.ssm_profile.name
}

