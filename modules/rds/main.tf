resource "aws_db_subnet_group" "database_private_cidr" {
    name = "db_private_subnets"
    subnet_ids = [var.vpc_sub_1, var.vpc_sub_2, var.vpc_sub_3]

    tags = {
        Name = "Private CIDR block for database."
    }
}

resource "aws_db_instance" "social-something-db" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.small"
  name                 = "socialsomethingdb"
  username             = var.rds_username
  password             = var.rds_password
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.database_private_cidr.id
}