## Architecture Diagram

![Architecture Diagram](https://github.com/harsh-viradia/host-laravel-application-aws-beanstalk/assets/140060556/3a8ecebd-3968-4980-846b-5b03782f5502)


## CloudFront and Route53

- In this repo I have not mentioned cloudfront and route53 code due to privacy and complances.
- To create these resource using terraform you just need to point it to the application load-balancer dns name and allow WAF for student panel. 
- For S3 static media from security generate key-group so no one can able to hit your static media without public and private key. 
- do not forgot to add private key in the code otherwise you will face "Missing Key" error.


## Load-balancer and Elastic Beanstalk

- This is the PHP8.1 laravel application so as per PHP documet root we have to set document root as "/public".
- Add health-check path in the load-balancer other-wise auto-scalling will not work.
- Do not forgot add SSL policy and HTTPS rule while creating elastic-beanstalk.

## Redis and RDS Cluster

- Redis and RDS instance is hosted in the private subnets so the traffic which only allow is from beanstalk sg not from anywhere else.

## Gitlab CICD

- gitlab CICD gives us 400 free mins but for our application we will use codepipeline for that we need one gitlab owner/admin account and buildspec file which I have provided in the code.
- pipeline code is also private due to privacy.

Blog: https://dev.to/viradiaharsh/host-php81-laravel-application-using-terraform-on-aws-276m
Author: https://www.linkedin.com/in/harsh-viradia/ 