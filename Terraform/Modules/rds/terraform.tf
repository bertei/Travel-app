resource "aws_db_instance" "main" {
  db_name    = var.db_name
  identifier = var.identifier

  #Config.
  engine              = var.engine
  engine_version      = var.engine_ver
  instance_class      = var.instance_class
  allocated_storage   = var.allocated_storage
  apply_immediately   = var.apply_immediately
  skip_final_snapshot = var.skip_final_snapshot
  username            = var.db_username
  password            = var.db_password

  #Networking
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [var.vpc_security_group_ids]
}

resource "aws_db_subnet_group" "main" {
  name       = var.db_subnet_group_name
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.db_subnet_group_name}"
  }
}