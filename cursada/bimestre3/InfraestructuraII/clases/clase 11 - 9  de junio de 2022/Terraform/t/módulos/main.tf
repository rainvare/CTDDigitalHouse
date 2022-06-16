#main.tf

provider "aws" {
region = var.region
}
module "vpc" {
source = "./vpc"
}

module "ec2" {
source = "./ec2"
namespace = var.namespace
subnet_id = module.vpc.subnet_id
}
