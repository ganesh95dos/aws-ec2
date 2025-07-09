output "public_ip" {
    value = aws_instance.my_instance.public_ip  
}

output "public_dns" {
    value = aws_instance.my_instance.public_dns  
}

output "instance_id" {
    value = aws_instance.my_instance.id  
}

output "instance_state" {
    value = aws_instance.my_instance.instance_state  
}


output "instance_ami" {
    value = aws_instance.my_instance.ami 
}
