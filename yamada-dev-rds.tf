resource "aws_db_instance" "application_application_rds" {
  identifier           = var.rds-identifier
  engine               = var.rds-engine
  engine_version       = var.rds-engine_version
  instance_class       = var.rds-instance_class
  allocated_storage    = var.rds-allocated_storage
  db_subnet_group_name = aws_db_subnet_group.application_application_db_subnet_group.name
  db_name              = var.rds-db_name
  username             = var.rds-username
  password             = var.rds-password
  deletion_protection = var.rds-deletion_protection
  multi_az             = var.rds-multi_az
  storage_type         = var.rds-storage_type
  publicly_accessible  = var.rds-publicly_accessible
  iam_database_authentication_enabled = var.rds-iam_database_authentication_enabled
  apply_immediately    = var.rds-apply_immediately
  backup_retention_period = var.rds-backup_retention_period
  backup_window = var.rds-backup_window 
  maintenance_window = var.rds-maintenance_window
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  skip_final_snapshot = var.rds-skip_final_snapshot
  final_snapshot_identifier = var.rds-final_snapshot_identifier

  # Enable enhanced monitoring
  monitoring_interval = var.rds-monitoring_interval
  monitoring_role_arn = var.rds-monitoring_role_arn

  # Enable performance insights
  performance_insights_enabled = var.rds-performance_insights_enabled

  enabled_cloudwatch_logs_exports = var.rds-enabled_cloudwatch_logs_exports

  tags = var.common_tags

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_db_subnet_group" "application_application_db_subnet_group" {
  name       = var.rds-subnet-group-name
  subnet_ids = [aws_subnet.private_subnet[0].id, aws_subnet.private_subnet[1].id]

  tags = var.common_tags
}