module "networking-vpc" {
  source               = "../vpc-networking/"
  vpc_cidr             = "10.20.0.0/16"
  vpc_tendency         = "default"
  vpc_name             = "project-1-vpc"
  public_subnet_name   = "project-1-subnet"
  public_subnets_cidrs = ["10.20.0.0/25", "10.20.0.128/25", "10.20.1.0/25"]
}


module "secutity-group" {
  source  = "../security-group/"
  sg_name = "project-1-sg"
  vpc_id  = module.networking-vpc.vpc_id
}


module "ec2" {
  source        = "../ec2/"
  ami_id        = "ami-08e2d37b6a0129927"
  instance_type = "t2.micro"
  subnet_id     = module.networking-vpc.subnet_ids[0]
  ec2_name      = "project-1-ec2"
  enable_ip     = true
  ec2_count     = 1
  sg_ids        = [module.secutity-group.sg_id]
}
