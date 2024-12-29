resource "aws_launch_template" "demolaunchtemplate" {
  name_prefix   = "demolaunchtemplate"  # Prefix for the template name
  description = "Initial Version"

  # EC2 Instance Configuration
  image_id      = var.demo_ami_id # Replace with your desired AMI ID
  instance_type = "t2.micro"               # Instance type (can be changed based on your requirement)
  key_name      =   var.key_name# Reference to the created key pair
  vpc_security_group_ids  = [var.security_group_id]

   tags = {
    Name = "demotemplate"
  }
}

# autoscaling_group.tf
resource "aws_autoscaling_group" "demo_autoscaling" {
    name               = "demo_autoscaling"
  desired_capacity     = 2      # Number of instances you want running
  max_size             = 4      # Max number of instances in the group
  min_size             = 1      # Min number of instances in the group
   vpc_zone_identifier = [ var.private_subnet_1_id, var.private_subnet_2_id  ]
   
  target_group_arns   = [var.demo_target_id]
  launch_template {
    id      = aws_launch_template.demolaunchtemplate.id
    version = "$Latest"
  }
  

  

  # Health check settings
  health_check_type     = "EC2"
  health_check_grace_period = 300
  wait_for_capacity_timeout = "0"
  force_delete          = true

  # Scaling Policies (Optional, based on your need to scale automatically)
  tag {
    key                 = "Name"
    value               = "AutoScalingInstance"
    propagate_at_launch = true
  }
}


