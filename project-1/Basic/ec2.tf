#key pair (login)
resource aws_key_pair my_key {

    key_name = "terra-key-ec2"
    public_key = file ("terra-key-ec2.pub")
}

#VPC & security group

resource aws_default_vpc default {
}

resource aws_security_group my_security_group {

    name = "automate-sg"
    description = "this will add a TF generated Security group"
    vpc_id = aws_default_vpc.default.id # interpolation

     # Inbound rules
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "SSH Open"
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "HTTP Open"
    }
    ingress {
        from_port = 8000
        to_port = 8000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Flask app"
    }
    # Outbond rules
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "all access open outbound"         
    }
    tags = {
        name = "automate-sg"
  }
}


#ec2 instance
resource "aws_instance" "My_instance"{
    for_each = tomap({
      TWS-junoon-automate-micro = "t2.micro",
      TWS-junoon-automate-medium = "t2.medium",
      TWS-junoon-automate-small = "t2.small"
    }) # mete argument

    depends_on = [ aws_security_group.my_security_group, aws_key_pair.my_key ]
    key_name = aws_key_pair.my_key.key_name
    vpc_security_group_ids = [aws_security_group.my_security_group.id] 
    instance_type = each.value
    ami = var.ec2_ami_id
    user_data = file("install_nginx.sh")

    root_block_device {
        volume_size = var.env == "prd" ? 20 : var.ec2_default_root_storage_size
        volume_type = "gp3" 
    }
    tags = {
    Name = each.key
    }
}

#If you want import manual instance in terraform
#resource "aws_instance" "my_new_instance" {
#    ami = "unknown"
#    instance_type = "unknown"
#  
#}