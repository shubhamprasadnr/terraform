variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  description = "CIDR block for public subnet 1"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for public subnet 2"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_subnet_1_cidr" {
  description = "CIDR block for private subnet 1"
  type        = string
  default     = "10.0.3.0/24"
}

variable "private_subnet_2_cidr" {
  description = "CIDR block for private subnet 2"
  type        = string
  default     = "10.0.4.0/24"
}

variable "public_subnet_1_az" {
  description = "Availability Zone for public subnet 1"
  type        = string
  default     = "ap-south-1a"
}

variable "public_subnet_2_az" {
  description = "Availability Zone for public subnet 2"
  type        = string
  default     = "ap-south-1b"
}

variable "private_subnet_1_az" {
  description = "Availability Zone for private subnet 1"
  type        = string
  default     = "ap-south-1a"
}

variable "private_subnet_2_az" {
  description = "Availability Zone for private subnet 2"
  type        = string
  default     = "ap-south-1b"
}

variable "destination_cidr_block" {
  type = string
  default = "0.0.0.0/0"
  description = "destination cidr "
}