variable "aws_security" {
    default = "my_TWS_security"
    type = string
    description = "This is security group name"
  
}

variable "my_instance_name" {
    default = "my_tws_instance" #This is AWS instance name
    type = string
    description = "This is my instance Name"
  
}

variable "ami" {
    default = "ami-0e35ddab05955cf57"
    type = string
    description = "This is my "
  
}

variable "instance_type" {
    default = "t2.micro"
    type = string
    description = "This is instance type"  
}

variable "root_volume_size" {
    default = 10
    type = number
    description = "This is defult volume Size"
}

variable "root_volume_type" {
    default = "gp3"
    type = string
    description = "This is Defult root volume type"
  
}
