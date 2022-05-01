resource "aws_db_parameter_group" "default" {
 name = "rds-set-log"
 family = "postgres14"
  parameter {
	name = "log_statement"
	value = "all"
	}
 parameter {
	name = "log_min_duration_statement"
	value = "1"
	}

}

resource "aws_db_instance" "education" {
  identifier             = "education"
  instance_class         = "db.t3.micro"
  allocated_storage      = 5
  engine                 = "postgres"
  engine_version         = "14.1"
  username               = "edu"
  password               = "edufoo123"
  backup_retention_period = 2
  //db_subnet_group_name   = aws_db_subnet_group.education.name
  //vpc_security_group_ids = [aws_security_group.rds.id]
  parameter_group_name   = aws_db_parameter_group.default.name
  //publicly_accessible    = true
  skip_final_snapshot    = true
  
  depends_on = [
  aws_db_parameter_group.default,
  ]
}