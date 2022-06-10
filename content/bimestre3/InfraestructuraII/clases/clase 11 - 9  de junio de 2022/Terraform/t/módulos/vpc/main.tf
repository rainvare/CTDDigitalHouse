resource "aws_subnet" "aws_subnet" {
  vpc_id     = "vpc-7a117c07"
  map_public_ip_on_launch = true
  cidr_block = "172.31.0.0/20"
  tags = {
    Name = "subnet"
  }

}
