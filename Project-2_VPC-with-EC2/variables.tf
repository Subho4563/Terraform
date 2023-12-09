variable "cidr" {
    default = "10.0.0.0/16"
}

variable "ami_id" {
    description = "AMI ID FOR THE INSTANCE"
    type = string
}

variable "instance_type" {
    description = "size of the instance, ex: t2.micro"
}
