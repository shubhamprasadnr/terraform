variable "vpc_id" {
    type = string
  default = "vpc"
}

variable "my_instance_id" {
  type = string
  default = "my_instance"
}

variable "security_group_id" {
  type = string
  default = "security_group"
}

variable "public_subnet_1_id" {
    type = string
    default = "public_subnet_1"
  
}
variable "public_subnet_2_id" {
  type = string
  default = "public_subnet_2"
}