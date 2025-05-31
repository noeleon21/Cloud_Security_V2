terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# # Create a VPC
# resource "aws_vpc" "web_vpc" {
#   cidr_block = "10.0.0.0/16"
# }

# #Creates public and private subnet
# resource "aws_subnet" "public_subnet" {
#   vpc_id     = aws_vpc.web_vpc.id
#   cidr_block = "10.0.16.0/20"
#   map_public_ip_on_launch = true
# }

# resource "aws_subnet" "private_subnet" {
#   vpc_id     = aws_vpc.web_vpc.id
#   cidr_block = "10.0.32.0/20"
# }

# #Attach internet gateway on the public subnet
# resource "aws_internet_gateway" "gw" {
#   vpc_id = aws_vpc.web_vpc.id
# }

# resource "aws_instance" "web" {
#   ami           = "ami-0953476d60561c955"
#   instance_type = "t2.micro"
#   user_data = file("install_web_server")
#   subnet_id = aws_subnet.public_subnet.id
# iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
# }


# resource "aws_iam_role" "ec2_role" {
#     name = "ec2-ssm-role"
#     assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#         {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Principal = {
#             Service = "ec2.amazonaws.com"
#         }
#         Sid    = ""
#         }
#     ]
#     })
# }

# resource "aws_iam_policy_attachment" "ec2_ssm_policy_attachment" {
#     name = "ec2-ssm-policy-attachment"
#     policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
# }

# resource "aws_iam_instance_profile" "ec2_instance_profile" {
#     name = "ec2-ssm-profile"
#     path    = "/"
#     role = aws_iam_role.ec2_role.name
# }

# resource "aws_security_group" "allow_tls" {
#   name        = "allow_tls"
#   description = "Allow TLS inbound traffic and all outbound traffic"
#   vpc_id      = aws_vpc.web_vpc.id

#   tags = {
#     Name = "allow_tls"
#   }
# }

# resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
#   security_group_id = aws_security_group.allow_tls.id
#   cidr_ipv4         = aws_vpc.web_vpc.cidr_block
#   from_port         = 443
#   ip_protocol       = "tcp"
#   to_port           = 443
# }

# resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
#   security_group_id = aws_security_group.allow_tls.id
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "-1" # semantically equivalent to all ports
# }

# #RDS Instance
# resource "aws_db_instance" "default" {
#   allocated_storage    = 10
#   db_name              = "mydb-instance"
#   engine               = "mysql"
#   engine_version       = "8.0"
#   instance_class       = "db.t3.micro"
#   username             = "foo"
#   password             = "foobarbaz"
#   parameter_group_name = "default.mysql8.0"
#   skip_final_snapshot  = true
# }

