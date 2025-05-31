# Cloud Security Project

## Objectives 
Set up an EC2 instance to host a web server.

Establish secure access from the EC2 instance to an RDS database instance.

Implement strict security measures while staying within the AWS Free Tier limits.

Use Terraform to deploy AWS services, demonstrating the benefits of Infrastructure as Code (IaC), such as easy reuse and automatic resource teardown.


## EC2
- Deployed an EC2 instance using the Amazon Linux 2023 AMI.
- Installed Apache (httpd) to host a basic web page.
- Implemented TLS/SSL using a self-signed certificate to enable HTTPS.
    - Note: Self-signed certificates are appropriate only for development environments, not for production.
    - A self-signed certificate was used due to the lack of a registered domain name.


## RDS
- Deployed a MySQL database on a t3.micro RDS instance.
- Database credentials (username and password) were stored in .tfvars files to prevent sensitive data from being exposed or committed to version control.


## VPC
- Created a public subnet for the EC2 instance.
- Created a private subnet for the RDS instance.
- Configured security groups to:
- Allow HTTPS (port 443) access to the EC2 instance.
- Allow MySQL (port 3306) access only from the EC2 instance to the RDS instance using the mysql command.
