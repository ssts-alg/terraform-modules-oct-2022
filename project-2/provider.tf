provider "aws" {
  region = var.region_name
}


variable "region_name" {
  default = "ap-south-1"
}

terraform {
  backend "s3" {
    bucket         = "terraform-s3-backend-bucket-380377972418"
    key            = "terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terrafom-locks"
  }
}
