resource "aws_instance" "name" {
  ami = "ami-0ebfd941bbafe70c6"
  instance_type = "t2.micro"
  key_name = "ansible"
}

resource "aws_s3_bucket" "name" {
  bucket = "akhil2003"
}

resource "aws_vpc" "name" {
  cidr_block = "0.0.0.0/18"
  tags = {
    name = "myvpc"
  }
}


