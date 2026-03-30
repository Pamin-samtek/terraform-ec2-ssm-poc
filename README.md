# Terraform EC2 SSM POC

This project creates a simple AWS EC2 instance using Terraform and enables management through AWS Systems Manager (SSM) without using SSH or EC2 user data.

## Resources Created
- VPC
- Public Subnet
- Internet Gateway
- Route Table and Association
- Security Group
- IAM Role for SSM
- IAM Instance Profile
- EC2 Instance

## Prerequisites
- AWS CLI configured
- Terraform installed
- Valid AWS permissions

## Commands

### Initialize
terraform init

### Validate
terraform validate

### Plan
terraform plan

### Apply
terraform apply

### Destroy
terraform destroy

## Verification
1. Go to EC2 Console and verify the instance is running.
2. Check that the IAM role is attached.
3. Open AWS Systems Manager.
4. Confirm the instance appears under Managed Instances or Fleet Manager.
5. Use Session Manager to connect.
6. Use Run Command with AWS-RunShellScript to execute test commands.

## Notes
- No SSH key pair is used.
- No port 22 is opened.
- No user data is used.
- This setup is meant for temporary testing / POC use.

