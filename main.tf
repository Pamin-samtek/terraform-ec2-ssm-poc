data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

module "network" {
  source = "./modules/network"

  project_name       = var.project_name
  environment        = var.environment
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = data.aws_availability_zones.available.names[0]
}

module "iam" {
  source = "./modules/iam"

  project_name = var.project_name
  environment  = var.environment
}

module "ec2" {
  source = "./modules/ec2"

  project_name           = var.project_name
  environment            = var.environment
  instance_name          = var.instance_name
  ami_id                 = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = module.network.public_subnet_id
  security_group_id      = module.network.security_group_id
  iam_instance_profile   = module.iam.instance_profile_name
}

