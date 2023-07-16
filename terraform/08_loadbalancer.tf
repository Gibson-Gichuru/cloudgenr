# # Create load balancer
# resource "aws_elb" "my_load_balancer" {
#   name               = "my-load-balancer"
#   subnets            = [aws_subnet.public_subnet.id]
#   security_groups    = [aws_security_group.my_security_group.id]
#   instances          = aws_instance.ec2_instance.*.id
#   cross_zone_load_balancing   = true

#     listener {
#     instance_port     = 80
#     instance_protocol = "HTTP"
#     lb_port           = 80
#     lb_protocol       = "HTTP"
#   }

#   health_check {
#     target              = "HTTP:80/"
#     interval            = 30
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#     timeout             = 5
#   }
# }