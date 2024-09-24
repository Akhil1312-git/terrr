resource "aws_instance" "name" {
  ami = "ami-0ebfd941bbafe70c6"
  instance_type = "t2.micro"
  key_name = "ansible"
  depends_on = [ aws_s3_bucket.bucket ]
}

resource "aws_s3_bucket" "bucket" {
  bucket = "akhilzxcvbnm"
  
}