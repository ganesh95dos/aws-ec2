output "public_ip" {
    value = aws_instance.my_tws_instance.public_ip  
}

output "public_dns" {
    value = aws_instance.my_tws_instance.public_dns  
}

output "instance_id" {
    value = aws_instance.my_tws_instance.id  
}

output "instance_state" {
    value = aws_instance.my_tws_instance.instance_state  
}


output "instance_ami" {
    value = aws_instance.my_tws_instance.ami 
}

output "aws_region" {
  value = data.aws_region.current.name
}
