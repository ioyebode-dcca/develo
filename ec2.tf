provider "aws" {
#access_key = "${var.aws_access_key}"
#secret_key = "${var.aws_secret_key}"
region = "${var.aws_region}"
}

# Terraform state will be stored in S3
# testing VSC
//terraform {
//backend "s3" {
//bucket = "forms3"
//key    = "terraform.tfstate"
//region = "us-east-1"
// }
//}


resource "aws_instance" "testing" {
ami = "${var.ami}"
vpc_security_group_ids = ["${aws_security_group.TFSG.id}"]
subnet_id = "${aws_subnet.TFSUB.id}"
associate_public_ip_address = true
instance_type = "t2.micro"
key_name = "TEST"
tags = {
  Name = "${var.aws_instance_name}"
 }
}

