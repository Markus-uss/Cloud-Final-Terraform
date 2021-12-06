# VPC

output "vpc_id" {
    value = aws_vpc.custom_vpc.id
}

# Load Balancer Public Subnets

output "lb_public_sub_1" {
    value = aws_subnet.lb_public_subnet_1.id
}

output "lb_public_sub_2" {
    value = aws_subnet.lb_public_subnet_2.id
}

output "lb_public_sub_3" {
    value = aws_subnet.lb_public_subnet_3.id
}

# Databbase Private Subnets

output "db_private_sub_1" {
    value = aws_subnet.db_private_subnet_1.id
}

output "db_private_sub_2" {
    value = aws_subnet.db_private_subnet_2.id
}

output "db_private_sub_3" {
    value = aws_subnet.db_private_subnet_3.id
}

# Application Private Subnets

output "app_private_sub_1" {
    value = aws_subnet.app_private_subnet_1.id
}

output "app_private_sub_2" {
    value = aws_subnet.app_private_subnet_2.id
}

output "app_private_sub_3" {
    value = aws_subnet.app_private_subnet_3.id
}

# Security Groups

output "public_sg" {
    value = aws_security_group.public_sg.id
}

output "private_sg" {
    value = aws_security_group.private_sg.id
}