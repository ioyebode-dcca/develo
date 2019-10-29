provider "aws" {
#access_key = "${var.aws_access_key}"
#secret_key = "${var.aws_secret_key}"
region = "${var.aws_region}"
}

resource "aws_instance" "teting" {
ami = "${var.ami}"
vpc_security_group_ids = ["${aws_security_group.TFSG.id}"]
subnet_id = "${aws_subnet.TFSUB.id}"
instance_type = "t2.micro"
key_name = "TEST"
tags {
Name = "${var.aws_instance_name}"
 }
}

