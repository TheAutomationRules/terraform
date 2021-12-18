# Configure the AWS Provider
provider "aws" {
  region     = "eu-central-1"
  access_key = ""
  secret_key = ""
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  //ami = "" // NO ES ELEGANTE!
  instance_type = "t2.micro"
  key_name = "rockemsockem"

  tags = {
    Name = "web-server"
  }
}

output "public_ip" {
  value       = aws_instance.web.public_ip
}