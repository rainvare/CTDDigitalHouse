output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "default_vpc_default_security_group_id" {
  description = "The ID of the security group created by default on Default VPC creation"
  value       = module.vpc.default_vpc_default_security_group_id
}

output "priv_ssh_security_group" {
  description = "The ID of the security group created por private ssh connections"
  value = resource.aws_security_group.allow_ssh_priv.id
}

output "pub_ssh_security_group" {
  description = "The ID of the security group created por piublic ssh connections"
  value = resource.aws_security_group.allow_ssh_pub.id
}