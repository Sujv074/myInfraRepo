variable "region" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "ami_id" {
  type = string
}
variable "instance_count" {    
  type = number 
  description = "Number of virtual machines to create"
}
