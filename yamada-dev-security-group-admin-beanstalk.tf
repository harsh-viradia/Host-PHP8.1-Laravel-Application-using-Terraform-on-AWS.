resource "aws_security_group" "admin_beanstlak_sg" {
  name        = var.admin-beanstalk-sg-name
  description = var.admin-beanstalk-sg-description

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
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
      Name = "${var.admin-beanstalk-sg-name}"
    }
  )
  
}