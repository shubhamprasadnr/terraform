output "vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.vpc.id
}


output "public_route_table_id" {
  description = "The ID of the public route table"
  value       = aws_route_table.public_route_table.id
}

output "private_route_table_id" {
  description = "The ID of the private route table"
  value       = aws_route_table.private_route_table.id
}

output "public_subnet_1_id" {
    value = aws_subnet.public_subnet_1.id
  
}

output "public_subnet_2_id"{
  value = aws_subnet.public_subnet_2.id
}
output "private_subnet_1_id" {
    value = aws_subnet.private_subnet_1.id
  
}

output "private_subnet_2_id"{
  value = aws_subnet.private_subnet_2.id
}