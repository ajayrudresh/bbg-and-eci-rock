provider "aws" {
  region = "us-west-2"
  shared_credentials_file = "/home/ajay/.aws/credentials"
}

resource "aws_instance" "demo_instance" {
  ami = "ami-0dc8f589abe99f538"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ "sg-02158d9ffd673f0fa" ]
  subnet_id = "subnet-d2455999"
  key_name = "eci"
  tags = {
    Name = "berenberg-and-eci-rock-Ajay"
  }
}

output "instance_private_ip" {
  value = aws_instance.demo_instance.private_ip
}
