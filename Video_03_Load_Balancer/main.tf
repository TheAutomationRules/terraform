# ----------------------------------------------------------------------------------------------------------------------
# AWS Auto Scaling Group
# ----------------------------------------------------------------------------------------------------------------------
provider "aws" {
  region = "eu-central-1"
  #access_key = ""
  #secret_key = ""
}
# LOCAL VARIABLES
locals {
  name_sufix = "tar"
  entity     = "The Automation Rules"
  creator    = "Terraform"
  az_prefix  = "eu-central"
  service    = "nginx"
  subnet_a   = "subnet-046982cad1aab2fe1"
  subnet_b   = "subnet-0cee383917de01aa1"
  subnet_c   = "subnet-0924692c40e3ef551"
  vpc_id     = "vpc-0880ad79cfcb4f10f"
}
# LAUNCH TEMPLATE
resource "aws_launch_template" "asg-template-t2micro" {
  name_prefix            = "asg-${local.service}-t2micro"
  image_id               = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  key_name               = "rockemsockem"
  user_data              = filebase64("${path.module}/user-data/bootstrap.sh")
  vpc_security_group_ids = [aws_security_group.sg_service.id]
}
# AUTO SCALING GROUP
resource "aws_autoscaling_group" "as-ubuntu" {
  vpc_zone_identifier = [local.subnet_a, local.subnet_b, local.subnet_c]
  desired_capacity    = 3
  max_size            = 3
  min_size            = 3

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