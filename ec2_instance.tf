data "aws_ami" "redhat" {
 most_recent = true

 filter {
   name   = "name"
   values = ["redhat/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
 }

 filter {
   name   = "virtualization-type"
   values = ["hvm"]
 }

 filter {
   name   = "architecture"
   values = ["x86_64"]
 }
 owners = ["099720109477"] #canonical
}

locals {
 instances = {
   instance1 = {
     ami           = data.aws_ami.redhat.id
     instance_type = "t2.micro"
   }
   instance2 = {
     ami           = data.aws_ami.redhat.id
     instance_type = "t2.micro"
   }
