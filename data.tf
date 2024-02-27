data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

data "aws_security_group" "selected" {
  filter {
    name   = "tag:Name"
    values = ["ssh-http-https"]
  }
}

data "aws_key_pair" "selected" {
  key_name = "NakytniakLab05Key"
}
