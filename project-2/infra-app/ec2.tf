#key pair (login)
resource "aws_key_pair" "my_key" {
  key_name = "${var.env}-infra-app-key"
  public_key = file ("terra-key-ec2.pub")

  tags = {
    Environment = var.env
  }
}

#VPC & security group

resource "aws_default_vpc" "default" {
}

resource "aws_security_group" "my_security_group" {

    name = "${var.env}-infra-app-sg"
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
    
    # Outbond rules
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "all access open outbound"         
    }
    tags = {
        name = "${var.env}-infra-app-sg"
  }
}


#ec2 instance
resource "aws_instance" "My_instance"{
  count = var.instance_count
  depends_on = [ aws_security_group.my_security_group, aws_key_pair.my_key ]
  key_name = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.my_security_group.id] 
  instance_type = var.instance_type
  ami = var.ec2_ami_id

  #user_data = file("install_nginx.sh")

    root_block_device {
        volume_size = var.env == "prd" ? 20 : 10
        volume_type = "gp3" 
    }
    tags = {
      Name = "${var.env}-infra-app-instance"
      Environment = var.env
    }
}

#If you want import manual instance in terraform
#resource "aws_instance" "my_new_instance" {
#    ami = "unknown"
#    instance_type = "unknown"
#  
#}