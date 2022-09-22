module "public_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.18.0"

  name = "public-sg"
  description = "Security Group with SSH port open for everybody (IPv4 CIDR), egress ports are all world open"
  vpc_id = module.vpc.vpc_id
  # Ingress Rules & CIDR Blocks
  ingress_rules = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  ingress_with_cidr_blocks = [
    {
      from_port   = 3000
      to_port     = 3000
      protocol    = "tcp"
      description = "quest secuity rule"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  # Egress Rule - all-all open
  egress_rules = ["all-all"]
}
