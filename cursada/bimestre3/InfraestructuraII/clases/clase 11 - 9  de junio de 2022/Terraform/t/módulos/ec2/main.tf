data "aws_ami" "amazon-linux-2" {
most_recent = true
owners = ["amazon"]

filter {
name = "name"
values = ["amzn2-ami-hvm*"]
}
}

resource "aws_instance" "ec2_public" {
ami = data.aws_ami.amazon-linux-2.id
associate_public_ip_address = true
instance_type = "t2.micro"
subnet_id = var.subnet_id

tags = {
"Name" = "${var.namespace}-EC2-PUBLIC"
}
}
