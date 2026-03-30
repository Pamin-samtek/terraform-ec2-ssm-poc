# Terraform EC2 + SSM POC

This project is a **Proof of Concept (POC)** demonstrating how to provision AWS infrastructure using Terraform and execute commands on an EC2 instance using AWS Systems Manager (SSM), without SSH access.

---

## Overview

The goal of this project is to:
- Provision infrastructure using Terraform
- Execute commands remotely using AWS SSM
- Avoid SSH-based access
- Keep the setup automated and scalable

---

## What This Project Does

- Creates a VPC, Subnet, and Security Group
- Launches an EC2 instance (t3.micro)
- Configures IAM Role & Instance Profile for SSM
- Enables SSM Agent communication
- Uses Terraform SSM Association to run commands
- Verifies execution via AWS Systems Manager

---

## Architecture

```
Terraform
   ↓
AWS Infrastructure (VPC + EC2 + IAM)
   ↓
SSM Association
   ↓
Execute commands on EC2
```

---

## Project Structure

```
terraform-ec2-ssm-poc/
│
├── main.tf
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
├── versions.tf
├── ssm.tf
├── README.md
├── .gitignore
│
└── modules/
    ├── ec2/
    ├── iam/
    └── network/
```

---

## Prerequisites

Make sure you have the following:

- AWS Account
- AWS CLI configured (`aws configure`)
- Terraform installed
- Git installed

---

## Setup Instructions

### 1. Clone the Repository

```
git clone https://github.com/<your-username>/terraform-ec2-ssm-poc.git
cd terraform-ec2-ssm-poc
```

---

### 2. Initialize Terraform

```
terraform init
```

---

### 3. Preview Infrastructure

```
terraform plan
```

---

### 4. Apply Changes

```
terraform apply
```

Type `yes` when prompted.

---

## SSM Command Execution

This project uses an SSM Association to run commands on the EC2 instance.

### Terraform Resource Example

```
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
```

---

## Verification

To verify execution:

1. Go to AWS Console  
2. Navigate to: Systems Manager → Run Command  
3. Check the output:

```
Hello from Terraform SSM
Dependencies resolved.
Nothing to do.
```

---

## Key Benefits

- No SSH access required
- Secure command execution via SSM
- Fully automated infrastructure setup
- Easy to extend with scripts or Ansible

---

