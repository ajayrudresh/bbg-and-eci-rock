variable subnet_id {
  type = string
}
variable sg_id {
  type = string
}

variable ami {
  default = "ami-0dc8f589abe99f538"
}

variable flavor {
  default = "t2.micro"
}

variable keyname {
  default = "eci" 
}

variable instance_name {
  type = string
}
