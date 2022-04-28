resource "aws_instance" "JWebServer"{
  ami                    = "ami-0b36cd6786bcfe120"
  instance_type          = "t2.micro"
  availability_zone 	 = "us-west-2c"
  key_name               = "AWS_March"
  monitoring             = false

  tags = {
    Name   = "web01"
    Environment = "dev"
    Terraform = "true"
  }
}

# VPC
resource "aws_vpc" "apr-terra-vpc" {
  cidr_block       = "20.0.0.0/16"
  tags = {
    Name = "apr-terra-vpc"
  }
}

# Subnet
resource "aws_subnet" "apr-terra-subnet" {
  vpc_id     = aws_vpc.apr-terra-vpc.id
  cidr_block = "20.0.1.0/24"
  availability_zone = "us-west-2c"
  map_public_ip_on_launch = true

  tags = {
    Name = "apr-terra-subnet"
  }
}

# IGW
resource "aws_internet_gateway" "apr-terra-igw" {
  vpc_id = aws_vpc.apr-terra-vpc.id

  tags = {
    Name = "apr-terra-igw"
  }
}

# RT
resource "aws_route_table" "apr-terra-RT" {
  vpc_id = aws_vpc.apr-terra-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.apr-terra-igw.id
  }
  tags = {
    Name = "apr-terra-RT"
  }
}

# RT Association
resource "aws_route_table_association" "apr-terra-RTassociate" {
  subnet_id      = aws_subnet.apr-terra-subnet.id
  route_table_id = aws_route_table.apr-terra-RT.id
}

