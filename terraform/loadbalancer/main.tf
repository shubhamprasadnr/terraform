# Target Group for ALB (Used to register instances or other resources)
resource "aws_lb_target_group" "demo_target" {
    target_type = "instance"
  name     = "demo-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  

   health_check {
    path                = "/"  # Make sure this path exists on your instances
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher            = "200"
  }

  tags = {
    Name = "demo-target-group"
  }
  
}
# Register EC2 instances to the ALB target group
resource "aws_lb_target_group_attachment" "target_attachement" {
  target_group_arn = aws_lb_target_group.demo_target.arn
  target_id        = var.my_instance_id
  port             = 80
}

# Application Load Balancer
resource "aws_lb" "load_lb" {
  name               = "demo-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = [var.public_subnet_1_id,var.public_subnet_2_id]
  # enable_deletion_protection = false
  # enable_cross_zone_load_balancing = true
  depends_on = [ aws_lb_target_group.demo_target ]

  tags = {
    Name = "demo-lb"
  }
}

# Listener for the Load Balancer with Target Group attachment
resource "aws_lb_listener" "example" {
  load_balancer_arn = aws_lb.load_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.demo_target.arn
  }
}
