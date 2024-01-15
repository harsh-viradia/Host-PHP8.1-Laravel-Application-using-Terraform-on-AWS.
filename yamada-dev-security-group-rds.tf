resource "aws_security_group" "rds_sg" {
  name        = var.rds-sg-name
  description = var.rds-sg-description

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = ["${aws_security_group.student_beanstlak_sg.id}"]
  }

    ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = ["${aws_security_group.admin_beanstlak_sg.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.public_access]
  }

  tags = merge(
    var.common_tags,
    {
      Name = "${var.rds-sg-name}"
    }
  )
}