# Create a VPC
resource "aws_vpc" "web_vpc" {
  cidr_block = "10.0.0.0/16"
}

#Creates public and private subnet
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.web_vpc.id
  cidr_block = "10.0.16.0/20"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"
  
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.web_vpc.id
  cidr_block = "10.0.32.0/20"
  
  availability_zone = "us-east-1b"
}

#Attach internet gateway on the public subnet
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.web_vpc.id
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.web_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "route_table"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.web_vpc.id

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4_http" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4_mysql" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 3306
  ip_protocol       = "tcp"
  to_port           = 3306
}
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
