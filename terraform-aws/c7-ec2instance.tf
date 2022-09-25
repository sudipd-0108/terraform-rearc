# AWS EC2 Instance Terraform Module
# Bastion Host - EC2 Instance that will be created in VPC Public Subnet
module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.17.0"
  # insert the 10 required variables here
  name                   = var.instance_name
  instance_count         = 2
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  #monitoring             = true
  #subnet_id              = module.vpc.public_subnets
  subnet_ids = [
    module.vpc.public_subnets[0],
    module.vpc.public_subnets[1]
  ]  
  vpc_security_group_ids = [module.public_sg.this_security_group_id]
  user_data              = "${file("user-data.sh")}"
}

