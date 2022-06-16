provider "aws" {
    region = var.region
}

module "vpc" {
    source = "./module/vpc"
    namespace = var.namespace
}

module "ec2" {
    source = "./module/ec2"
    namespace = var.namespace
    vpc-public-subnets = module.vpc.public_subnets
    vpc-private-subnets = module.vpc.private_subnets
    sg_pub_id = module.vpc.pub_ssh_security_group
    sg_priv_id = module.vpc.priv_ssh_security_group
}

