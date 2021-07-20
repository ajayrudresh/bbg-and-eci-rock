variable vpc_cidr {
  default = "192.168.0.0/16"
}

variable subnet_cidr {
  default = "192.168.1.0/24"
}

variable availability_zone {
  default = "us-west-2a"
}

variable vpc-name {
 description = "Name of the VPC"
 type = string
}

variable vpc-subnet-name {
 description = "Name of the Subnet"
 type = string
}
