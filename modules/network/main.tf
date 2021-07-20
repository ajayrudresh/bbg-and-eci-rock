
resource "aws_vpc" "bbg-vpc" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  tags = {
    Name = "${var.vpc-name}"
  }
}

resource "aws_internet_gateway" "bbg-ig" {
  vpc_id = aws_vpc.bbg-vpc.id

  tags = {
    Name = "bbg-ig"
  }
}

resource "aws_route_table" "bbg-rt" {
  vpc_id = aws_vpc.bbg-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.bbg-ig.id
  }
   tags = {
    Name = "bbg-rt"
  }
}

resource "aws_main_route_table_association" "bbg-a" {
  vpc_id         = aws_vpc.bbg-vpc.id
  route_table_id = aws_route_table.bbg-rt.id
}

resource "aws_subnet" "bbg-subnet" {
  vpc_id = "${aws_vpc.bbg-vpc.id}"
  cidr_block = "${var.subnet_cidr}"
  availability_zone = "${var.availability_zone}"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.vpc-subnet-name}"
  }
}

resource "aws_security_group" "bbg-sg" {
  name        = "bbg-sg"
  vpc_id      = aws_vpc.bbg-vpc.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "bbg-sg"
  }
}
