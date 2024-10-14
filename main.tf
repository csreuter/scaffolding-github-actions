# main.tf

resource "null_resource" "foo" {
  triggers = {
    foo = var.project
  }
}

resource "aws_instance" "ec2-instance_qd6CrqSfippaDfgJ" {
  ami                    = data.aws_ami.ec2-instance_qd6CrqSfippaDfgJ.id
  instance_type          = "c5a.8xlarge"
  key_name               = "ec2-instance_qd6CrqSfippaDfgJ"
  vpc_security_group_ids = [aws_security_group.ec2-instance_qd6CrqSfippaDfgJ_0.id]

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

resource "aws_key_pair" "ec2-instance_qd6CrqSfippaDfgJ" {
  key_name   = "ec2-instance_qd6CrqSfippaDfgJ"
  public_key = "asdjfkladsjf"
}

resource "aws_security_group" "ec2-instance_qd6CrqSfippaDfgJ_0" {
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

data "aws_ami" "ec2-instance_qd6CrqSfippaDfgJ" {
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
