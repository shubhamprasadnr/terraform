

variable "vpc_id" {
  type = string
  default = "vpc"
  
}

variable "private_subnet_1_id" {
  type = string
  default = "private_subnet_1"
}
variable "security_group_id" {
    type = string
    default = "security_group"
  
}

variable "private_subnet_1_az" {
  description = "Availability Zone for private subnet 1"
  type        = string
  default     = "ap-south-1a"
}
 
    
    
  


variable "instance_type" {
    type = string
    default = "t2.micro" 
}
variable "ami" {
    type = string
    default = "ami-053b12d3152c0cc71"
  
}

variable "public_subnet_1_id" {
  type = string
  default = "public_subnet_1"
  
}
variable "public_subnet_1_az_id" {
  default = "public_subnet_1_az"
  
}
variable "key_name" {
  type = string
  default = "paritosh"
  
}

variable "public_subnet_1_az" {
  description = "Availability Zone for public subnet 1"
  type        = string
  default     = "ap-south-1a"
}