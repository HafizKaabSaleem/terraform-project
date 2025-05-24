variable "env" {
    description = "This is the environment for my infra"
    type = string
}

variable "bucket_name" {
  description = "This is the name for my infra"
  type = string
}

variable "instance_count" {
    description = "This is no. of ec2 ins"
    type = number
}

variable "instance_type" {
    description = "This is the instance type for my Ec2 infra"
    type = string  
}

variable "ec2_ami_id" {
    description = "This is the instance ami id for my Ec2 infra"
    type = string  
}

variable "hash_key" {
    description = "This is the hash key for my dynamodb infra"
    type = string
  
}