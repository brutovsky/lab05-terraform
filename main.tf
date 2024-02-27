terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"

  backend "s3" {
    bucket = "lab05-tfstate"
    key    = "nakytniak/terraform.tfstate"
    region = "eu-west-2"
  }
}

provider "aws" {
  region = "eu-west-2"
}

locals {
  key_pair = "NakytniakKubKey"
}

resource "aws_instance" "app_server" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = data.aws_key_pair.selected.key_name
  vpc_security_group_ids = [data.aws_security_group.selected.id]

  tags = {
    Name = "Lab05-Nakytniak"
  }
}
