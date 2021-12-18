/*
RECOMENDED:
$ export AWS_ACCESS_KEY_ID="accesskey"
$ export AWS_SECRET_ACCESS_KEY="secretkey"
$ export AWS_DEFAULT_REGION="us-west-2"
*/

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}