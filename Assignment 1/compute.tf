# Web Tier Launch Configuration (Commented out due to LocalStack limitations)
# resource "aws_launch_configuration" "web" {
#   name          = "web-config"
#   instance_type = "t2.micro"
#   image_id      = "ami-123456" # Replace with your actual AMI ID

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# Web Tier Auto Scaling Group (Commented out due to LocalStack limitations)
# resource "aws_autoscaling_group" "web_asg" {
#   launch_configuration = aws_launch_configuration.web.id
#   min_size             = 1
#   max_size             = 2
#   vpc_zone_identifier  = [aws_subnet.public.id]
# }

# Application Tier Launch Configuration (Commented out due to LocalStack limitations)
# resource "aws_launch_configuration" "app" {
#   name          = "app-config"
#   instance_type = "t2.micro"
#   image_id      = "ami-123456" # Replace with your actual AMI ID

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# Application Tier Auto Scaling Group (Commented out due to LocalStack limitations)
# resource "aws_autoscaling_group" "app_asg" {
#   launch_configuration = aws_launch_configuration.app.id
#   min_size             = 1
#   max_size             = 2
#   vpc_zone_identifier  = [aws_subnet.private.id]
# }

# ALB for Web Tier (Commented out due to LocalStack limitations)
# resource "aws_lb" "web_alb" {
#   name               = "web-alb"
#   load_balancer_type = "application"
#   subnets            = [aws_subnet.public.id]
#   internal           = false
# }

# ALB Listener (Commented out due to LocalStack limitations)
# resource "aws_lb_listener" "web_listener" {
#   load_balancer_arn = aws_lb.web_alb.arn
#   port              = 80
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.web_tg.arn
#   }
# }

# Target Group (Commented out due to LocalStack limitations)
# resource "aws_lb_target_group" "web_tg" {
#   name     = "web-tg"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = aws_vpc.main.id
# }

# Replacement for Web Tier - Single EC2 Instance
resource "aws_instance" "web_instance" {
  ami           = "ami-123456" 
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "web-instance"
  }
}

# Replacement for Application Tier - Single EC2 Instance
resource "aws_instance" "app_instance" {
  ami           = "ami-123456" 
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  tags = {
    Name = "app-instance"
  }
}
