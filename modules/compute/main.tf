resource "aws_instance" "demo_instance" {
  ami           = "${var.ami}"
  instance_type = "${var.flavor}"
  associate_public_ip_address = true
  key_name = "${var.keyname}"
  subnet_id = "${var.subnet_id}"
  availability_zone = "us-west-2a"
  tags = {
    Name = "${var.instance_name}"
  }
  vpc_security_group_ids = [ "${var.sg_id}" ]
}
