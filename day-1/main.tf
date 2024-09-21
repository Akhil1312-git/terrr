resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/18"
  tags = {
    name = "myvpc"
  }
}
resource "aws_subnet" "sub1" {
     vpc_id = aws_vpc.name.id
  cidr_block = "10.0.0.0/20"
  tags = {
    name= "public"
  }
}

resource "aws_subnet" "sub2" {
  vpc_id = aws_vpc.name.id
  cidr_block = "10.0.1.0/24"
  tags = {
    name= "pvt"
  }
}

resource "aws_internet_gateway" "name" {
    vpc_id = aws_vpc.name.id
  
}

resource "aws_route_table" "cust" {
    vpc_id = aws_vpc.name.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.name.id
    }
  
}


resource "aws_route_table_association" "name" {
    subnet_id = aws_subnet.sub1.id
    route_table_id = aws_route_table.cust.id
  
}

resource "aws_security_group" "name" {
  name = "sg"
  description = "allow all SSH traffic"
  vpc_id = aws_vpc.name.id
tags = {
  name = "security group-1"
  }


 ingress {
    description ="allow ssh"
    from_port = "22"
    to_port = "22"
    protocol = "TCP"

  }
}

resource "aws_instance" "name" {
  ami = "ami-0ebfd941bbafe70c6"
  instance_type = "t2.micro"
  key_name = "jenkins"
  subnet_id = aws_subnet.sub1.id
  security_groups = [aws_security_group.name.id]
  
}