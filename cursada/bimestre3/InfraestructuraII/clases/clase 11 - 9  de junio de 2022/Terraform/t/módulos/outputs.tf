# outputs.tf
output "ip_publica" {
value = "${module.ec2.public_ip}"
}

output "dnse" {
value = "${module.ec2.public_dns}"
}
