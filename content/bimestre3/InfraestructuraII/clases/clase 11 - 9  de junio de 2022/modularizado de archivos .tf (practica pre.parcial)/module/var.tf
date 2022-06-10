variable "name" {
  description = "vpc"
}
variable region {
    description = "us-west-2"
}

variable "vpc_cidr_block" {
  description = "10.0.0.0/16"
}

variable "public_subnets_cidr_block" {
  type        = list
  description = "10.0.1.0/24"
}

variable "security_group"{
    description = "seguridad tf"
}