resource "aws_elastic_beanstalk_application" "admin-elasticapp" {
  name = var.admin_beanstalk_application_name
  tags = var.common_tags
}

resource "aws_elastic_beanstalk_environment" "admin-beanstalkappenv" {
  name                = var.admin_beanstalk_environment_name
  application         = aws_elastic_beanstalk_application.admin-elasticapp.name
  solution_stack_name = var.admin_solution_stack_name

  setting {
    namespace = var.admin-aws-ec2-vpc-namespace
    name      = var.admin-aws-ec2-vpc-name
    value     = aws_vpc.my_vpc.id
  }

  setting {
    namespace = var.admin-autoscaling-iam-namespace
    name      = var.admin-autoscaling-iam-name
    value     = var.admin-autoscaling-iam-value
  }
  setting {
    namespace = var.admin-ec2-public-ip-namespace
    name      = var.admin-ec2-public-ip-name
    value     = var.admin-ec2-public-ip-value
  }

  setting {
    namespace = var.admin-ec2-subnets-name
    name      = var.admin-ec2-subnets-value
    value     = join(",", aws_subnet.public_subnet[*].id)
  }

  setting {
    namespace = var.admin-lb-status-code-namespace
    name      = var.admin-lb-status-code-name
    value     = var.admin-lb-status-code-value
  }

  setting {
    namespace = var.admin-lb-health-check-path-namespace
    name      = var.admin-lb-health-check-path-name
    value     = var.admin-lb-health-check-path-value
  }

  setting {
    namespace = var.admin-nginx-document-root-namespace
    name      = var.admin-nginx-document-root-name
    value     = var.admin-nginx-document-root-value
  }

  provisioner "remote-exec" {
    inline = [
      var.admin-set-document-root,
      var.admin-httpd
    ]
  }

  setting {
    namespace = var.admin-lb-type-namespace
    name      = var.admin-lb-type-name
    value     = var.admin-lb-type-value
  }
  
  setting {
    namespace = var.admin-ec2-type-namespace
    name      = var.admin-ec2-type-name
    value     = var.admin-ec2-type-value
  }

  setting {
    namespace = var.admin-elb-scheme-namespace
    name      = var.admin-elb-scheme-name
    value     = var.admin-elb-scheme-value
  }
  
  setting {
    namespace = var.admin-autoscalling-minsize-namespace
    name      = var.admin-autoscalling-minsize-name
    value     = var.admin-autoscalling-minsize-value
  }
  setting {
    namespace = var.admin-autoscalling-maxsize-namespace
    name      = var.admin-autoscalling-maxsize-name
    value     = var.admin-autoscalling-maxsize-value
  }
  setting {
    namespace = var.admin-systemtype-namespace
    name      = var.admin-systemtype-name
    value     = var.admin-systemtype-value
  }

  setting {
    namespace = var.admin-trigger-upperthreshold-namespace
    name      = var.admin-trigger-upperthreshold-name
    value     = var.admin-trigger-upperthreshold-value
  }
  setting {
    namespace = var.admin-trigger-lowerthreshold-namespace
    name      = var.admin-trigger-lowerthreshold-name
    value     = var.admin-trigger-lowerthreshold-value
  }

  setting {
    namespace = var.admin-trigger-measure-namespace
    name      = var.admin-trigger-measure-name 
    value     = var.admin-trigger-measure-value
  }

  setting {
    namespace = var.admin-trigger-statistic-namespace
    name      = var.admin-trigger-statistic-name
    value     = var.admin-trigger-statistic-value
  }

  setting {
    namespace = var.admin-trigger-unit-namespace
    name      = var.admin-trigger-unit-name
    value     = var.admin-trigger-unit-value
  }


  setting {
    namespace = var.admin-command-timeout-namespace
    name      = var.admin-command-timeout-name
    value     = var.admin-command-timeout-name
  }
}
