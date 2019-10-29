resource "aws_vpc" "TFVPC" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "TFVPC"
  }
}

resource "aws_subnet" "TFSUB" {
  vpc_id     = "${aws_vpc.TFVPC.id}"
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "TFSUB"
  }
}

resource "aws_subnet" "TFSUB1" {
  vpc_id     = "${aws_vpc.TFVPC.id}"
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "TFSUB1"
  }
}

resource "aws_internet_gateway" "TFGW" {
  vpc_id = "${aws_vpc.TFVPC.id}"

  tags = {
    Name = "TFIG"
  }
}

resource "aws_route_table" "TFRT" {
  vpc_id = "${aws_vpc.TFVPC.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.TFGW.id}"
  }

  tags = {
    Name = "TFRT"
  }
}

resource "aws_route_table_association" "TFRTA1" {
  subnet_id      = "${aws_subnet.TFSUB1.id}"
  route_table_id = "${aws_route_table.TFRT.id}"
}

resource "aws_route_table_association" "TFRTA" {
  subnet_id      = "${aws_subnet.TFSUB.id}"
  route_table_id = "${aws_route_table.TFRT.id}"
}

resource "aws_security_group" "TFSG" {
  name        = "TFSG"
  description = "Allow TLS inbound traffic"
  vpc_id      = "${aws_vpc.TFVPC.id}"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

