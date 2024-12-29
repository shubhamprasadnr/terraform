# Key Pair (Optional)
# resource "aws_key_pair" "my_key" {
#   key_name   = "my-key-pair"
#   public_key = file("~/.ssh/id_rsa.pub")  # Path to your SSH public key
# }

resource "aws_instance" "my_instance" {
  ami = var.ami

  instance_type = var.instance_type  # Instance type (free tier eligible)
  security_groups = [var.security_group_id]
#   key_name = aws_key_pair.my_key
  subnet_id = var.private_subnet_1_id
  availability_zone =var.private_subnet_1_az# Specify the desired availability zone
  key_name = var.key_name

  # Ensure the instance is running (if stopped, it will start)
  lifecycle {
    create_before_destroy = true
  }
  
  tags ={
    Name = "Kafka"
  }
  
}


resource "aws_instance" "pvtinstance" {
  ami = var.ami
  instance_type = var.instance_type  # Instance type (free tier eligible)
  security_groups = [var.security_group_id]
#   key_name = aws_key_pair.my_key
  subnet_id = var.private_subnet_1_id
  availability_zone =var.private_subnet_1_az
  key_name      = var.key_name

lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "myinstance"
  }
}

# Optional: Allocate an Elastic IP
# resource "aws_eip" "my_eip" {
#   instance = aws_instance.my_instance.id
# }

resource "aws_instance" "instance" {
  ami = var.ami

  instance_type = var.instance_type  # Instance type (free tier eligible)
  security_groups = [var.security_group_id]
#   key_name = aws_key_pair.my_key
  subnet_id = var.public_subnet_1_id
  availability_zone =var.public_subnet_1_az_id# Specify the desired availability zone
  key_name = var.key_name
  # Ensure the instance is running (if stopped, it will start)
  lifecycle {
    create_before_destroy = true
  }
  
  tags ={
    Name = "pubinstance"
  }
}