variable "demo_ami_id" {
    type = string 
    default = "demo_ami"
  
}

variable "key_name" {
    default = "paritosh"
  
}

variable "security_group_id" {
    default = "security_group"
  
}
variable "public_subnet_1_id" {
    default = "public_subnet_1"
  
}
variable "public_subnet_2_id" {
    default = "public_subnet_2"
  
}
variable "demo_target_id" {
    default = "demo_target_id"
  
}

variable "private_subnet_1_id" {
  default = "private_subnet_1"
}

variable "private_subnet_2_id" {
  default = "private_subnet_2"
}