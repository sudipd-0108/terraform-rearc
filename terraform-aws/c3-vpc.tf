module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.4"  
  

  # VPC Basic Details
  name = "vpc-dev"
  cidr = "10.0.0.0/16"   
  azs                 = ["us-east-1a", "us-east-1b"]
  public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]




  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support = true

}
