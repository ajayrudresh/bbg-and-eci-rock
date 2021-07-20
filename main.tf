provider "aws" {
  region = "us-west-2"
  shared_credentials_file = "/home/ajay/.aws/credentials"
}

module "network" {
  source = "./modules/network"
  availability_zone = "us-west-2a"
  vpc-name = "bbg-vpc"
  vpc-subnet-name= "bbg-public-subnet"
}

module "compute" {
  source = "./modules/compute"
  ami = "ami-0dc8f589abe99f538"
  flavor = "t2.micro"
  instance_name = "bbg-and-eci-rock-Ajay"
  subnet_id = "${module.network.subnet_id}"
  sg_id = "${module.network.sg_id}"
}
