resource "aws_elasticache_cluster" "application-redis-cluster" {
  cluster_id           = var.redis-cluster_id 
  engine               = var.redis-engine
  node_type            = var.redis-node_type
  num_cache_nodes      = var.redis-num_cache_nodes
  engine_version       = var.redis-engine_version
  port                 = var.redis-port
  security_group_ids = [ aws_security_group.redis_sg.id ]

  log_delivery_configuration {
    destination      = aws_cloudwatch_log_group.application-redis-cloudwatch-log-group.name
    destination_type = var.redis-destination_type
    log_format       = var.redis-log_format
    log_type         = var.redis-engin-log_type
  }

    log_delivery_configuration {
    destination      = aws_cloudwatch_log_group.application-redis-cloudwatch-log-group.name
    destination_type = var.redis-destination_type
    log_format       = var.redis-log_format
    log_type         = var.redis-slow-log_type
  }
  tags = var.common_tags
  subnet_group_name = aws_elasticache_subnet_group.my_subnet_group.name
}

resource "aws_elasticache_subnet_group" "my_subnet_group" {
  name        = var.redis-subnet-group-name
  description = var.redis-subnet-group-name

  subnet_ids = [aws_subnet.private_subnet[0].id, aws_subnet.private_subnet[1].id]  # Replace with your subnet IDs
}