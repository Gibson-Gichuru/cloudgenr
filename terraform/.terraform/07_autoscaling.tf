resource "aws_autoscaling_group" "my_autoscaling_group" {
  launch_configuration = aws_launch_configuration.my_launch_configuration.id
  availability_zones   = ["us-east-1a"]
  min_size             = 2
  max_size             = 4

  tag {
    key                 = "Name"
    value               = "my-instance"
    propagate_at_launch = true
  }
}

resource "aws_launch_configuration" "my_launch_configuration" {
  image_id          = "ami-053b0d53c279acc90"
  instance_type     = "t2.micro"
  security_groups   = [aws_security_group.my_security_group.id]
}
