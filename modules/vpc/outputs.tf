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

# Load Balaner Private Subnets

output "lb_private_sub_1" {
    value = aws_subnet.lb_private_subnet_1.id
}

output "lb_private_sub_2" {
    value = aws_subnet.lb_private_subnet_2.id
}

output "lb_private_sub_3" {
    value = aws_subnet.lb_private_subnet_3.id
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