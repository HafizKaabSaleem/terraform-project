#Output For Count
#output "ec2_public_ip"{
#    value = aws_instance.My_instance[*].public_ip
#}
#
#output "ec2_public_dns"{
#    value = aws_instance.My_instance[*].public_dns
#}
#
#output "ec2_private_ip"{
#    value = aws_instance.My_instance[*].private_ip
#}

#Outputs For Each
output "ec2_public_ip" {
  value = [
    for instance in aws_instance.My_instance : instance.public_ip
  ]
}

output "ec2_public_dns" {
  value = [
    for instance in aws_instance.My_instance : instance.public_dns
  ]
}

output "ec2_private_ip" {
  value = [
    for instance in aws_instance.My_instance : instance.private_ip
  ]
}