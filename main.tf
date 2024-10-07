# main.tf

resource "null_resource" "foo" {
  triggers = {
    foo = var.project
  }
}

resource "aws_instance" "My_EC2_Instance_CtDqEEq6h92y2VSy" {
  ami                    = data.aws_ami.My_EC2_Instance_CtDqEEq6h92y2VSy.id
  instance_type          = "a1.large"
  key_name               = "My EC2 Instance_CtDqEEq6h92y2VSy"
  vpc_security_group_ids = [aws_security_group.My_EC2_Instance_CtDqEEq6h92y2VSy_0.id]

  ebs_block_device {
    device_name = "ebs_block"
    volume_type = "gp3"
    volume_size = 10
  }

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }
}

resource "aws_key_pair" "My_EC2_Instance_CtDqEEq6h92y2VSy" {
  key_name   = "My EC2 Instance_CtDqEEq6h92y2VSy"
  public_key = "adsfkjlads"
}

resource "aws_security_group" "My_EC2_Instance_CtDqEEq6h92y2VSy_0" {
  name        = "Allow Ingress"
  description = "Allow ingress from specific CIDR"

  ingress {
    description = "inbound ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["1.2.3.4/32"]
  }
}

data "aws_ami" "My_EC2_Instance_CtDqEEq6h92y2VSy" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
