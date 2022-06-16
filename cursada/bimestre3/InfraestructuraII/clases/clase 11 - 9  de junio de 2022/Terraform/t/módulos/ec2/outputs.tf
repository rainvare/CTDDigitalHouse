#outputs.tf
output "public_ip" {
value = aws_instance.ec2_public.public_ip
}
output "public_dns" {
value = aws_instance.ec2_public.public_dns
}
