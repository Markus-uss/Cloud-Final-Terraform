resource "aws_vpc" "custom_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "A Custom VPC"
  }
}

# Load Balancer Public Subnets

resource "aws_subnet" "lb_public_subnet_1" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = var.lb_pub_sub_1
  availability_zone = var.az_1

  tags = {
    Name = "Load Balancer Public Subnet 1"
  }
}

resource "aws_subnet" "lb_public_subnet_2" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = var.lb_pub_sub_2
  availability_zone = var.az_2

  tags = {
    Name = "Load Balancer Public Subnet 2"
  }
}

resource "aws_subnet" "lb_public_subnet_3" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = var.lb_pub_sub_3
  availability_zone = var.az_3

  tags = {
    Name = "Load Balancer Public Subnet 3"
  }
}

# Application Private Subnets

resource "aws_subnet" "app_private_subnet_1" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = var.app_pri_sub_1
  availability_zone = var.az_1

  tags = {
    Name = "Application Private Subnet 1"
  }
}

resource "aws_subnet" "app_private_subnet_2" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = var.app_pri_sub_2
  availability_zone = var.az_2

  tags = {
    Name = "Application Private Subnet 2"
  }
}

resource "aws_subnet" "app_private_subnet_3" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = var.app_pri_sub_3
  availability_zone = var.az_3

  tags = {
    Name = "Application Private Subnet 3"
  }
}

# Database Private Subnets

resource "aws_subnet" "db_private_subnet_1" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = var.db_pri_sub_1
  availability_zone = var.az_1

  tags = {
    Name = "Database Private Subnet 1"
  }
}

resource "aws_subnet" "db_private_subnet_2" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = var.db_pri_sub_2
  availability_zone = var.az_2

  tags = {
    Name = "Database Private Subnet 2"
  }
}

resource "aws_subnet" "db_private_subnet_3" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = var.db_pri_sub_3
  availability_zone = var.az_3

  tags = {
    Name = "Database Private Subnet 3"
  }
}

# Internet Gateway

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.custom_vpc.id

  tags = {
    Name = "An Internet Gateway"
  }
}

# Public Route Table

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.custom_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

# Public Route Table Association

resource "aws_route_table_association" "public_rt_a_1" {
  subnet_id      = aws_subnet.lb_public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_rt_a_2" {
  subnet_id      = aws_subnet.lb_public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_rt_a_3" {
  subnet_id      = aws_subnet.lb_public_subnet_3.id
  route_table_id = aws_route_table.public_rt.id
}

# Public Security Group

resource "aws_security_group" "public_sg" {
  name   = "HTTP and SSH"
  vpc_id = aws_vpc.custom_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "private_sg" {
  name   = "Private HTTP"
  vpc_id = aws_vpc.custom_vpc.id

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}
