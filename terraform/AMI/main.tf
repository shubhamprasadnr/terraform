# Create AMI from EC2 Instance
# Create an AMI from the EC2 Instance
resource "aws_ami_from_instance" "demo_ami" {
  name               = "demo-instance-ami"
  description        = "AMI created from example EC2 instance"
  source_instance_id = var.my_instance_id
  tags = {
    Name = "demo-instance-ami"
  }
   depends_on = [ var.my_instance_id ]
  
}