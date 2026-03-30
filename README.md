 Terraform EC2 + SSM POC
This project demonstrates how to provision AWS infrastructure using Terraform and execute commands on an EC2 instance using AWS Systems Manager (SSM).

 What this project does
Creates a VPC + Subnet + Security Group
Launches an EC2 instance (t3.micro)
Configures IAM Role + Instance Profile for SSM
Enables SSM Agent communication
Uses Terraform SSM Association to run commands on EC2
Verifies execution via AWS Systems Manager

 Architecture
Terraform
  ↓
AWS Infrastructure (VPC + EC2 + IAM)
  ↓
SSM Association
  ↓
Execute commands on EC2

 Project Structure
terraform-ec2-ssm-poc/
│
├── main.tf
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
├── versions.tf
├── README.md
├── .gitignore
│
└── modules/
   ├── ec2/
   ├── iam/
   └── network/

 Prerequisites
AWS Account
AWS CLI configured (aws configure)
Terraform installed
Git installed

 Setup Instructions
1. Clone repo
git clone https://github.com/<your-username>/terraform-ec2-ssm-poc.git
cd terraform-ec2-ssm-poc

2. Initialize Terraform
terraform init

3. Preview infrastructure
terraform plan

4. Apply changes
terraform apply
Type yes when prompted.

 SSM Command Execution
This project uses:
resource "aws_ssm_association" "run_script" {
 name = "AWS-RunShellScript"

 targets {
   key    = "InstanceIds"
   values = [module.ec2.instance_id]
 }

 parameters = {
   commands = "echo Hello from Terraform SSM && sudo yum update -y"
 }

 depends_on = [module.ec2]
}

Verification
Go to:
AWS Console → Systems Manager → Run Command
Check output:
Hello from Terraform SSM
Dependencies resolved.
Nothing to do.

