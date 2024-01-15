#------------------------ VPC Variables ---------------------------

variable "application-vpc" {
  type = string
  default = "application-vpc"
}

variable "vpc_cidr" {
  type = string
  default = "11.0.0.0/16"
}

variable "public_access" {
  type = string
  default = "0.0.0.0/0"
}

variable "availability_zones" {
  default = ["ap-northeast-1a", "ap-northeast-1c"]
}

#--------------------------Comann variable -----------------------------

variable "common_tags" {
  type    = map(string)
  default = {
    created-by    = ""
    maintain-by   = ""
    owner         = ""
    sensitive     = ""
    environment   = ""
  }
}

#----------------------------admin-Beanstlak-Variable------------------------------------

variable "admin_beanstalk_application_name" {
  type = string
  default = "application-admin-application"
}

variable "admin_beanstalk_environment_name" {
  type = string
  default = "application-admin-environment-application"
}

variable "admin_solution_stack_name" {
  type = string
  default = "64bit Amazon Linux 2023 v4.0.4 running PHP 8.1"
}

variable "admin-aws-ec2-vpc-namespace" {
  type = string
  default = "aws:ec2:vpc"
}

variable "admin-aws-ec2-vpc-name" {
  type = string
  default = "VPCId"
}

variable "admin-autoscaling-iam-namespace" {
  type = string
  default = "aws:autoscaling:launchconfiguration"
}

variable "admin-autoscaling-iam-name" {
  type = string
  default = "IamInstanceProfile"
}

variable "admin-autoscaling-iam-value" {
  type = string
  default = "aws-elasticbeanstalk-ec2-role-admin"
}

variable "admin-ec2-public-ip-namespace" {
  type = string
  default = "aws:ec2:vpc"
}

variable "admin-ec2-public-ip-name" {
  type = string
  default = "AssociatePublicIpAddress"
}

variable "admin-ec2-public-ip-value" {
  type = string
  default = "True"
}

variable "admin-ec2-subnets-name" {
  type = string
  default = "aws:ec2:vpc"
}

variable "admin-ec2-subnets-value" {
  type = string
  default = "Subnets"
}

variable "admin-lb-status-code-namespace" {
  type = string
  default = "aws:elasticbeanstalk:environment:process:default"
}

variable "admin-lb-status-code-name" {
  type = string
  default = "MatcherHTTPCode"
}

variable "admin-lb-status-code-value" {
  type = string
  default = "200"
}

variable "admin-lb-health-check-path-namespace" {
  type = string
  default = "aws:elasticbeanstalk:environment:process:default"
}

variable "admin-lb-health-check-path-name" {
  type = string
  default = "HealthCheckPath"
}

variable "admin-lb-health-check-path-value" {
  type = string
  default = "/health-check"
}

variable "admin-nginx-document-root-namespace" {
  type = string
  default = "aws:elasticbeanstalk:container:php:phpini"
}

variable "admin-nginx-document-root-name" {
  type = string
  default = "allow_url_fopen"
}

variable "admin-nginx-document-root-value" {
  type = string
  default = "On"
}

variable "admin-set-document-root" {
  type = string
  default = "echo 'DocumentRoot = \"/public\"' | sudo tee -a /etc/httpd/conf.d/elasticbeanstalk/php.conf"
}

variable "admin-httpd" {
  type = string
  default = "sudo service httpd restart"
}

variable "admin-lb-type-namespace" {
  type = string
  default = "aws:elasticbeanstalk:environment"
}

variable "admin-lb-type-name" {
  type = string
  default = "LoadBalancerType"
}

variable "admin-lb-type-value" {
  type = string
  default = "application"
}

variable "admin-ec2-type-namespace" {
  type = string
  default = "aws:autoscaling:launchconfiguration"
}

variable "admin-ec2-type-name" {
  type = string
  default = "InstanceType"
}

variable "admin-ec2-type-value" {
  type = string
  default = "t3.medium"
}

variable "admin-elb-scheme-namespace" {
  type = string
  default = "aws:ec2:vpc"
}

variable "admin-elb-scheme-name" {
  type = string
  default = "ELBScheme"
}

variable "admin-elb-scheme-value" {
  type = string
  default = "internet facing"
}

variable "admin-autoscalling-minsize-namespace" {
  type = string
  default = "aws:autoscaling:asg"
}

variable "admin-autoscalling-minsize-name" {
  type = string
  default = "MinSize"
}

variable "admin-autoscalling-minsize-value" {
  type = string
  default = "1"
}

variable "admin-autoscalling-maxsize-namespace" {
  type = string
  default = "aws:autoscaling:asg"
}

variable "admin-autoscalling-maxsize-name" {
  type = string
  default = "MaxSize"
}

variable "admin-autoscalling-maxsize-value" {
  type = string
  default = "4"
}

variable "admin-systemtype-namespace" {
  type = string
  default = "aws:elasticbeanstalk:healthreporting:system"
}

variable "admin-systemtype-name" {
  type = string
  default = "SystemType"
}

variable "admin-systemtype-value" {
  type = string
  default = "enhanced"
}

variable "admin-trigger-upperthreshold-namespace" {
  type = string
  default = "aws:autoscaling:trigger"
}

variable "admin-trigger-upperthreshold-name" {
  type = string
  default = "UpperThreshold"
}

variable "admin-trigger-upperthreshold-value" {
  type = string
  default = "60"
}

variable "admin-trigger-lowerthreshold-namespace" {
  type = string
  default = "aws:autoscaling:trigger"
}

variable "admin-trigger-lowerthreshold-name" {
  type = string
  default = "LowerThreshold"
}

variable "admin-trigger-lowerthreshold-value" {
  type = string
  default = "30"
}

variable "admin-trigger-measure-namespace" {
  type = string
  default = "aws:autoscaling:trigger"
}

variable "admin-trigger-measure-name" {
  type = string
  default = "MeasureName"
}

variable "admin-trigger-measure-value" {
  type = string
  default = "CPUUtilization"
}

variable "admin-trigger-statistic-namespace" {
  type = string
  default = "aws:autoscaling:trigger"
}

variable "admin-trigger-statistic-name" {
  type = string
  default = "Statistic"
}

variable "admin-trigger-statistic-value" {
  type = string
  default = "Average"
}

variable "admin-trigger-unit-namespace" {
  type = string
  default = "aws:autoscaling:trigger"
}

variable "admin-trigger-unit-name" {
  type = string
  default = "Unit"
}

variable "admin-trigger-unit-value" {
  type = string
  default = "Bytes"
}

variable "admin-command-timeout-namespace" {
  type = string
  default = "aws:elasticbeanstalk:command"
}

variable "admin-command-timeout-name" {
  type = string
  default = "Timeout"
}

variable "admin-command-timeout-value" {
  type = string
  default = "600"
}

#-------------------------------------student-Beanstalk-Variable----------------------------------

variable "student_beanstalk_application_name" {
  type = string
  default = "application-student-application"
}

variable "student_beanstalk_environment_name" {
  type = string
  default = "application-student-environment-application"
}

variable "student_solution_stack_name" {
  type = string
  default = "64bit Amazon Linux 2023 v4.0.4 running PHP 8.1"
}

variable "student-aws-ec2-vpc-namespace" {
  type = string
  default = "aws:ec2:vpc"
}

variable "student-aws-ec2-vpc-name" {
  type = string
  default = "VPCId"
}

variable "student-autoscaling-iam-namespace" {
  type = string
  default = "aws:autoscaling:launchconfiguration"
}

variable "student-autoscaling-iam-name" {
  type = string
  default = "IamInstanceProfile"
}

variable "student-autoscaling-iam-value" {
  type = string
  default = "aws-elasticbeanstalk-ec2-role-student"
}

variable "student-ec2-public-ip-namespace" {
  type = string
  default = "aws:ec2:vpc"
}

variable "student-ec2-public-ip-name" {
  type = string
  default = "AssociatePublicIpAddress"
}

variable "student-ec2-public-ip-value" {
  type = string
  default = "True"
}

variable "student-ec2-subnets-name" {
  type = string
  default = "aws:ec2:vpc"
}

variable "student-ec2-subnets-value" {
  type = string
  default = "Subnets"
}

variable "student-lb-status-code-namespace" {
  type = string
  default = "aws:elasticbeanstalk:environment:process:default"
}

variable "student-lb-status-code-name" {
  type = string
  default = "MatcherHTTPCode"
}

variable "student-lb-status-code-value" {
  type = string
  default = "200"
}

variable "student-lb-health-check-path-namespace" {
  type = string
  default = "aws:elasticbeanstalk:environment:process:default"
}

variable "student-lb-health-check-path-name" {
  type = string
  default = "HealthCheckPath"
}

variable "student-lb-health-check-path-value" {
  type = string
  default = "/health-check"
}

variable "student-nginx-document-root-namespace" {
  type = string
  default = "aws:elasticbeanstalk:container:php:phpini"
}

variable "student-nginx-document-root-name" {
  type = string
  default = "allow_url_fopen"
}

variable "student-nginx-document-root-value" {
  type = string
  default = "On"
}

variable "student-set-document-root" {
  type = string
  default = "echo 'DocumentRoot = \"/public\"' | sudo tee -a /etc/httpd/conf.d/elasticbeanstalk/php.conf"
}

variable "student-httpd" {
  type = string
  default = "sudo service httpd restart"
}

variable "student-lb-type-namespace" {
  type = string
  default = "aws:elasticbeanstalk:environment"
}

variable "student-lb-type-name" {
  type = string
  default = "LoadBalancerType"
}

variable "student-lb-type-value" {
  type = string
  default = "application"
}

variable "student-ec2-type-namespace" {
  type = string
  default = "aws:autoscaling:launchconfiguration"
}

variable "student-ec2-type-name" {
  type = string
  default = "InstanceType"
}

variable "student-ec2-type-value" {
  type = string
  default = "t3.medium"
}

variable "student-elb-scheme-namespace" {
  type = string
  default = "aws:ec2:vpc"
}

variable "student-elb-scheme-name" {
  type = string
  default = "ELBScheme"
}

variable "student-elb-scheme-value" {
  type = string
  default = "internet facing"
}

variable "student-autoscalling-minsize-namespace" {
  type = string
  default = "aws:autoscaling:asg"
}

variable "student-autoscalling-minsize-name" {
  type = string
  default = "MinSize"
}

variable "student-autoscalling-minsize-value" {
  type = string
  default = "1"
}

variable "student-autoscalling-maxsize-namespace" {
  type = string
  default = "aws:autoscaling:asg"
}

variable "student-autoscalling-maxsize-name" {
  type = string
  default = "MaxSize"
}

variable "student-autoscalling-maxsize-value" {
  type = string
  default = "4"
}

variable "student-systemtype-namespace" {
  type = string
  default = "aws:elasticbeanstalk:healthreporting:system"
}

variable "student-systemtype-name" {
  type = string
  default = "SystemType"
}

variable "student-systemtype-value" {
  type = string
  default = "enhanced"
}

variable "student-trigger-upperthreshold-namespace" {
  type = string
  default = "aws:autoscaling:trigger"
}

variable "student-trigger-upperthreshold-name" {
  type = string
  default = "UpperThreshold"
}

variable "student-trigger-upperthreshold-value" {
  type = string
  default = "60"
}

variable "student-trigger-lowerthreshold-namespace" {
  type = string
  default = "aws:autoscaling:trigger"
}

variable "student-trigger-lowerthreshold-name" {
  type = string
  default = "LowerThreshold"
}

variable "student-trigger-lowerthreshold-value" {
  type = string
  default = "30"
}

variable "student-trigger-measure-namespace" {
  type = string
  default = "aws:autoscaling:trigger"
}

variable "student-trigger-measure-name" {
  type = string
  default = "MeasureName"
}

variable "student-trigger-measure-value" {
  type = string
  default = "CPUUtilization"
}

variable "student-trigger-statistic-namespace" {
  type = string
  default = "aws:autoscaling:trigger"
}

variable "student-trigger-statistic-name" {
  type = string
  default = "Statistic"
}

variable "student-trigger-statistic-value" {
  type = string
  default = "Average"
}

variable "student-trigger-unit-namespace" {
  type = string
  default = "aws:autoscaling:trigger"
}

variable "student-trigger-unit-name" {
  type = string
  default = "Unit"
}

variable "student-trigger-unit-value" {
  type = string
  default = "Bytes"
}

variable "student-command-timeout-namespace" {
  type = string
  default = "aws:elasticbeanstalk:command"
}

variable "student-command-timeout-name" {
  type = string
  default = "Timeout"
}

variable "student-command-timeout-value" {
  type = string
  default = "600"
}

#---------------------------------------RDS Variables-----------------------

variable "rds-identifier" {
  type = string
  default = "application-rds"
}

variable "rds-engine" {
  type = string
  default = "mysql"
}

variable "rds-engine_version" {
  type = string
  default = "8.0"
}

variable "rds-instance_class" {
  type = string
  default = "db.t4g.small"
}

variable "rds-allocated_storage" {
  type = number
  default = 50
}

variable "rds-db_name" {
  type = string
  default = "applicationapplicationdb"
}

variable "rds-username" {
  type = string
  default = "admin"
}

variable "rds-password" {
  type = string
  default = "uXiQPdE1MNdmTp2"
}

variable "rds-deletion_protection" {
  type = bool
  default = false
}

variable "rds-multi_az" {
  type = bool
  default = true
}

variable "rds-storage_type" {
  type = string
  default = "gp3"
}

variable "rds-publicly_accessible" {
  type = bool
  default = false
}

variable "rds-iam_database_authentication_enabled" {
  type = bool
  default = false
}

variable "rds-apply_immediately" {
  type = bool
  default = true
}

variable "rds-backup_retention_period" {
  type = number
  default = 3
}

variable "rds-backup_window" {
  type = string
  default = "01:00-02:00" # UTC backup window (hh24:mi-hh24:mi format)
}

variable "rds-maintenance_window" {
  type = string
  default = "sun:02:00-sun:03:30" # UTC maintenance window
}

variable "rds-skip_final_snapshot" {
  type = bool
  default = true
}

variable "rds-final_snapshot_identifier" {
  type = string
  default = "application-snapshot"
}

variable "rds-monitoring_interval" {
  type = number
  default = 60
}

variable "rds-monitoring_role_arn" {
  type = string
  default = "arn:aws:iam::ACCOUNT-ID:role/rds-monitoring-role"
}

variable "rds-performance_insights_enabled" {
  type = bool
  default = false
}

variable "rds-enabled_cloudwatch_logs_exports" {
  type = list(string)
  default = [ "error", "general", "slowquery" ]
}

variable "rds-subnet-group-name" {
  type = string
  default = "application-db-subnet-group"
}

#-----------------------------------------------RDS Security Group------------------------------------------

variable "rds-sg-name" {
  type = string
  default = "application-rds-sg"
}

variable "rds-sg-description" {
  type = string
  default = "Security group for rds sg"
}

#------------------------------------------------Redis Security Group--------------------------------------------

variable "redis-sg-name" {
  type = string
  default = "application-redis_sg"
}

variable "redis-sg-description" {
  type = string
  default = "Security group for redis sg"
}

#-----------------------------------------------student Beanstalk sg---------------------------------------------

variable "student-beanstalk-sg-name" {
  type = string
  default = "application-student-beanstalk-sg"
}

variable "student-beanstalk-sg-description" {
  type = string
  default = "Security group for student beanstalk sg"
}

#-----------------------------------------------Admin Beanstalk sg---------------------------------------------

variable "admin-beanstalk-sg-name" {
  type = string
  default = "application-admin-beanstalk-sg"
}

variable "admin-beanstalk-sg-description" {
  type = string
  default = "Security group for admin beanstalk sg"
}

variable "redis-cluster_id" {
  type = string
  default = "application-redis-cluster"
}

variable "redis-engine" {
  type = string
  default = "redis"
}

variable "redis-node_type" {
  type = string
  default = "cache.r7g.large"
}

variable "redis-engine_version" {
  type = string
  default = "7.1"
}

variable "redis-port" {
  type = number
  default = 6379
}

variable "redis-destination_type" {
  type = string
  default = "cloudwatch-logs"
}

variable "redis-log_format" {
  type = string
  default = "json"
}

variable "redis-slow-log_type" {
  type = string
  default = "slow-log"
}

variable "redis-engin-log_type" {
  type = string
  default = "engine-log"
}

variable "redis-subnet-group-name" {
  type = string
  default = "application-redis-subnet-group"
}

variable "redis-replication_group_id" {
  type = string
  default = "application-redis-replication-group"
}

variable "redis-description" {
  type = string
  default = "application-redis-cluster-replication"
}

variable "redis-num_cache_clusters" {
  type = number
  default = 2
}

variable "redis-parameter_group_name" {
  type = string
  default = "default.redis7"
}

variable "redis-automatic_failover_enabled" {
  type = bool
  default = true
}

variable "redis-num_cache_nodes" {
  type = number
  default = 1
}

variable "cloudwatch-log-name" {
  type = string
  default = "application-redis-cloudwatch-logs"
}