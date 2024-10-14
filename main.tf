# main.tf

resource "null_resource" "foo" {
  triggers = {
    foo = var.project
  }
}

resource "aws_instance" "ec2-instance_bxYDG3ZqC2GZpWSY" {
  ami                    = data.aws_ami.ec2-instance_bxYDG3ZqC2GZpWSY.id
  instance_type          = "c5.12xlarge"
  key_name               = "ec2-instance_bxYDG3ZqC2GZpWSY"
  vpc_security_group_ids = [aws_security_group.ec2-instance_bxYDG3ZqC2GZpWSY_0.id]

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

resource "aws_key_pair" "ec2-instance_bxYDG3ZqC2GZpWSY" {
  key_name   = "ec2-instance_bxYDG3ZqC2GZpWSY"
  public_key = "adsfdasf"
}

resource "aws_security_group" "ec2-instance_bxYDG3ZqC2GZpWSY_0" {
  name        = "Allow Ingress"
  description = "Allow ingress from specific CIDR"

  ingress {
    description = "inbound ssh"
    from_port   = 23
    to_port     = 24
    protocol    = "tcp"
    cidr_blocks = ["1.2.3.4/32"]
  }
}

data "aws_ami" "ec2-instance_bxYDG3ZqC2GZpWSY" {
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
