resource "aws_elastic_beanstalk_application" "student-elasticapp" {
  name = var.student_beanstalk_application_name
  tags = var.common_tags
}

resource "aws_elastic_beanstalk_environment" "student-beanstalkappenv" {
  name                = var.student_beanstalk_environment_name
  application         = aws_elastic_beanstalk_application.student-elasticapp.name
  solution_stack_name = var.student_solution_stack_name

  setting {
    namespace = var.student-aws-ec2-vpc-namespace
    name      = var.student-aws-ec2-vpc-name
    value     = aws_vpc.my_vpc.id
  }

  setting {
    namespace = var.student-autoscaling-iam-namespace
    name      = var.student-autoscaling-iam-name
    value     = var.student-autoscaling-iam-value
  }
  setting {
    namespace = var.student-ec2-public-ip-namespace
    name      = var.student-ec2-public-ip-name
    value     = var.student-ec2-public-ip-value
  }

  setting {
    namespace = var.student-ec2-subnets-name
    name      = var.student-ec2-subnets-value
    value     = join(",", aws_subnet.public_subnet[*].id)
  }

  setting {
    namespace = var.student-lb-status-code-namespace
    name      = var.student-lb-status-code-name
    value     = var.student-lb-status-code-value
  }

  setting {
    namespace = var.student-lb-health-check-path-namespace
    name      = var.student-lb-health-check-path-name
    value     = var.student-lb-health-check-path-value
  }

  setting {
    namespace = var.student-nginx-document-root-namespace
    name      = var.student-nginx-document-root-name
    value     = var.student-nginx-document-root-value
  }

  provisioner "remote-exec" {
    inline = [
      var.student-set-document-root,
      var.student-httpd
    ]
  }

  setting {
    namespace = var.student-lb-type-namespace
    name      = var.student-lb-type-name
    value     = var.student-lb-type-value
  }
  
  setting {
    namespace = var.student-ec2-type-namespace
    name      = var.student-ec2-type-name
    value     = var.student-ec2-type-value
  }

  setting {
    namespace = var.student-elb-scheme-namespace
    name      = var.student-elb-scheme-name
    value     = var.student-elb-scheme-value
  }
  
  setting {
    namespace = var.student-autoscalling-minsize-namespace
    name      = var.student-autoscalling-minsize-name
    value     = var.student-autoscalling-minsize-value
  }
  setting {
    namespace = var.student-autoscalling-maxsize-namespace
    name      = var.student-autoscalling-maxsize-name
    value     = var.student-autoscalling-maxsize-value
  }
  setting {
    namespace = var.student-systemtype-namespace
    name      = var.student-systemtype-name
    value     = var.student-systemtype-value
  }

  setting {
    namespace = var.student-trigger-upperthreshold-namespace
    name      = var.student-trigger-upperthreshold-name
    value     = var.student-trigger-upperthreshold-value
  }
  setting {
    namespace = var.student-trigger-lowerthreshold-namespace
    name      = var.student-trigger-lowerthreshold-name
    value     = var.student-trigger-lowerthreshold-value
  }

  setting {
    namespace = var.student-trigger-measure-namespace
    name      = var.student-trigger-measure-name 
    value     = var.student-trigger-measure-value
  }

  setting {
    namespace = var.student-trigger-statistic-namespace
    name      = var.student-trigger-statistic-name
    value     = var.student-trigger-statistic-value
  }

  setting {
    namespace = var.student-trigger-unit-namespace
    name      = var.student-trigger-unit-name
    value     = var.student-trigger-unit-value
  }


  setting {
    namespace = var.student-command-timeout-namespace
    name      = var.student-command-timeout-name
    value     = var.student-command-timeout-name
  }
}
