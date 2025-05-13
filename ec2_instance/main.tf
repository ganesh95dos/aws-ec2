#Required Key pair
resource "aws_key_pair" "my_key" {
    key_name = "tws_key"
    public_key = file("tws_key.pub")
  
}

#Required VPC
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

#required Securite group
resource "aws_security_group" "my_TWS_security" {
    name = var.aws_security
    description = "This is defult security group"
    vpc_id = aws_default_vpc.default.id

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    }

    ingress{
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    description = "This is SSH port"
  }
    
    ingress{
    from_port        = 80
    to_port          = 80
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    description = "This is HTTP port"
  }

   ingress{
    from_port        = 8000
    to_port          = 8000
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    description = "This is web application port"
  }

    tags = {
    Name = var.aws_security
  }
}

#Required ec2 instance
resource "aws_instance" "my_instance" {

    key_name = aws_key_pair.my_key.key_name
    security_groups = [aws_security_group.my_TWS_security.name]

    ami = var.ami
    instance_type = var.instance_type

    root_block_device {
        volume_size = var.root_volume_size
        volume_type = var.root_volume_type
      
    }

    tags = {
    Name = var.my_instance_name
  }
  
}

