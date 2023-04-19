provider "aws" {
  region = var.aws_region
}
data "aws_vpc" "default" {
  id = var.vpc_id
}

data "aws_subnet" "subnet1" {
  id = var.subnet_id
}

resource "aws_network_interface" "network1" {
  count = var.instance_count
  subnet_id = data.aws_subnet.subnet1.id

  tags = {
    Name = "primary_network_interface-${count.index}"
  }
}

resource "aws_instance" "my-machine" {
  count = var.instance_count
  ami           = var.ami_id    
  instance_type = "t2.micro"  
  tags = {
    Name = "my-machine-${count.index}"
  }
  network_interface {
    network_interface_id = aws_network_interface.network1[count.index].id
    device_index         = 0
  }
}
