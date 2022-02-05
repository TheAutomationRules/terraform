# AWS ASG (AutoScaling Group)

provider "aws" {
  region = "eu-central-1"
}

resource "aws_launch_template" "asg-template-t2micro" {
  name_prefix   = "asg-template-t2micro"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = "rockemsockem"
  user_data = filebase64("${path.module}/user-data/bootstrap.sh")
}

resource "aws_autoscaling_group" "as-ubuntu" {
  availability_zones = ["eu-central-1a"]
  desired_capacity   = 3
  max_size           = 3
  min_size           = 2

  launch_template {
    id      = aws_launch_template.asg-template-t2micro.id
    version = aws_launch_template.asg-template-t2micro.latest_version
  }

  tag {
    key                 = "Name"
    value               = "NODO-ASG"
    propagate_at_launch = true
  }
}