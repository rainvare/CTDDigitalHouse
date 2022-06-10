#Variables locales 
locals {
  name                       = var.name
  region                     = var.region
  cidr_block                 = var.vpc_cidr_block
  public_subnets_cidr_block  = var.public_subnets_cidr_block
  name_sec                   = var.segurity_group
}

#Proveedor y región
provider "aws" {
  region =  local.region
}

# VPC
resource "aws_vpc" "vpc" {
  cidr_block       = local.cidr_block
  instance_tenancy = "default"

  tags = {
    Name = local.name
  }
}


# Subnet pública

resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = local.public_subnets_cidr_block
  
  tags = {
    Name = "${local.name} Public Subnet"
  }

}

# *Extra - Security Group of VPC
resource "aws_security_group" "security_group" {
  name        = "${local.name} Security Group"
  description = "Default"
  vpc_id      = aws_vpc.vpc.id
  depends_on  = [
    aws_vpc.vpc
  ]

  ingress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = true
  }

  egress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = true
  }

  tags = "${local.name_sec} extra"
}