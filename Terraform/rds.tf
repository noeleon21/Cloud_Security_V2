#RDS Instance
resource "aws_db_instance" "myrds" {
  allocated_storage    = 10
  db_name              = "mydbinstancenoel"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql8.0"
  publicly_accessible = false
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  db_subnet_group_name  = aws_db_subnet_group.mycustomdb.name
}

resource "aws_db_subnet_group" "mycustomdb" {
  name       = "main1"
  subnet_ids = [aws_subnet.public_subnet.id, aws_subnet.private_subnet.id]
}