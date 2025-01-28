# main.tf

resource "null_resource" "foo" {
  triggers = {
    foo = var.project
  }
}

resource "aws_instance" "my-ec2-instance_FKbHrcVt2skcs4TB" {
  ami                    = data.aws_ami.my-ec2-instance_FKbHrcVt2skcs4TB.id
  instance_type          = "a1.2xlarge"
  key_name               = "my-ec2-instance_FKbHrcVt2skcs4TB"
  vpc_security_group_ids = [aws_security_group.my-ec2-instance_FKbHrcVt2skcs4TB_0.id]

  ebs_block_device {
    device_name = "ebs-block"
    volume_type = "gp3"
    volume_size = 50
  }

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }
}

resource "aws_key_pair" "my-ec2-instance_FKbHrcVt2skcs4TB" {
  key_name   = "my-ec2-instance_FKbHrcVt2skcs4TB"
  public_key = "adsfadsfd"
}

resource "aws_security_group" "my-ec2-instance_FKbHrcVt2skcs4TB_0" {
  name        = "Allow Ingress"
  description = "Allow ingress from specific CIDR"

  ingress {
    description = "inbound ssh"
    from_port   = 22
    to_port     = 23
    protocol    = "tcp"
    cidr_blocks = ["1.2.3.4/32"]
  }
}

data "aws_ami" "my-ec2-instance_FKbHrcVt2skcs4TB" {
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
