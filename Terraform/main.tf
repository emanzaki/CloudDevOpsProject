data "aws_vpc" "default" {
  default = true
}

data "aws_subnet" "default" {
  vpc_id = data.aws_vpc.default.id
  availability_zone = "${var.aws_region}a"
}


resource "tls_private_key" "server" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "server" {
  key_name = "${var.fort-tag}-key"
  public_key =  trimspace(tls_private_key.server.public_key_openssh)
}

resource "local_file" "server_private_key" {
  content = tls_private_key.server.private_key_pem
  filename = "${path.cwd}/../server-info/${var.fort-tag}-key.pem"
  file_permission = "0400"  
}

resource "aws_security_group" "sg" {
  name        = "${var.fort-tag}-sg"
  description = "Security group for FortStak application"
  vpc_id     = data.aws_vpc.default.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "fortstak" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = data.aws_subnet.default.id
  associate_public_ip_address = true
  key_name = aws_key_pair.server.key_name
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = "${var.fort-tag}-instance"
  }
}


resource "local_file" "fortstak_public_ip" {
  content  = aws_instance.fortstak.public_ip
  filename = "${path.cwd}/../server-info/inventory"

}