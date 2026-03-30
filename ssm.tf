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

