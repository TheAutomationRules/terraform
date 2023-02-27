# ------------------------------------------------------------------------------
# AWS NETWORKING
# ------------------------------------------------------------------------------
# VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "vpc-${local.entity}-${local.environment}"
  }
}

# PUBLIC SUBNETS
resource "aws_subnet" "public_subnets" {
  vpc_id                  = aws_vpc.vpc.id
  for_each                = local.pub_subnets_cidr
  cidr_block              = each.value
  availability_zone       = each.key
  map_public_ip_on_launch = true

  tags = {
    Name = "pub-net-${each.key}"
  }
  depends_on = [aws_vpc.vpc]
}

# INTERNET GATEWAY
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "gw-${local.entity}-${local.environment}"
  }
  depends_on = [aws_vpc.vpc]
}

# ROUTING TABLE
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.routing_table_cird_block
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "rt-${local.entity}-${local.environment}"
  }
  depends_on = [aws_vpc.vpc]
}

# ROUTING TABLE ASSOCIATION
resource "aws_route_table_association" "public-rt-subnets" {
  for_each       = aws_subnet.public_subnets
  subnet_id      = each.value.id
  route_table_id = aws_route_table.rt.id
  depends_on     = [aws_subnet.public_subnets, aws_route_table.rt]
}
