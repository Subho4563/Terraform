resource "aws_vpc" "my-vpc" {
    cidr_block = var.cidr
}

resource "aws_subnet" "subnet1" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = "true"
  }

resource "aws_security_group" "sg1" {
    name = "security"
    vpc_id = aws_vpc.my-vpc.id
  }

resource "aws_instance" "subho" {
    ami = "ami-0fc5d935ebf8bc3bc"
    instance_type = "t2.micro"
    key_name = "deep.login"
    subnet_id = aws_subnet.subnet1.id
    vpc_security_group_ids = [aws_security_group.sg1.id]
}
