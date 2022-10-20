module "networking-vpc" {
  source               = "../vpc-networking/"
  vpc_cidr             = var.vpc_cidr
  vpc_tendency         = "default"
  vpc_name             = "project-2-vpc"
  public_subnet_name   = "project-2-subnet"
  public_subnets_cidrs = ["10.30.0.0/25", "10.30.0.128/25", "10.30.1.0/25"]
}


module "secutity-group" {
  source  = "../security-group/"
  sg_name = "project-2-sg"
  vpc_id  = module.networking-vpc.vpc_id
}


# module "ec2" {
#   source        = "../ec2/"
#   ami_id        = "ami-01216e7612243e0ef"
#   instance_type = "t2.micro"
#   subnet_id     = module.networking-vpc.subnet_ids[1]
#   ec2_name      = "project-2-ec2"
#   enable_ip     = false
#   ec2_count     = 1
#   sg_ids        = [module.secutity-group.sg_id]
# }
