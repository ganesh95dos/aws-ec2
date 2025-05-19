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
    name = "my_TWS_security"
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
    Name = "my_TWS_security"
  }
}

#Required ec2 instance
resource "aws_instance" "my_tws_instance" {

    key_name = aws_key_pair.my_key.key_name
    security_groups = [aws_security_group.my_TWS_security.name]

    ami = "ami-0e35ddab05955cf57"
    instance_type = "t2.micro"

    root_block_device {
        volume_size = 10
        volume_type = "gp3"
      
    }

    tags = {
    Name = "my_tws_instance"
  }
  
}

