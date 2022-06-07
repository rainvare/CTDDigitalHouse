variable "namespace" {
    type = string
}

variable "vpc-public-subnets" {
    type = any
}

variable "vpc-private-subnets" {
    type = any
}

variable "sg_pub_id" {
    type = any
}

variable "sg_priv_id" {
    type = any
}