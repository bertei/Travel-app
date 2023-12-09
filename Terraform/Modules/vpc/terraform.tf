##VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    Name = var.vpc_tag
  }
}

##Subnet
resource "aws_subnet" "public_subnets" {
  count = length(var.public_subnet_cidrs)

  vpc_id = aws_vpc.main.id
  cidr_block = element(var.public_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "Public subnet ${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnets" {
  count = length(var.private_subnet_cidrs)

  vpc_id = aws_vpc.main.id
  cidr_block = element(var.private_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "Private subnet ${count.index + 1}"
  }
}

##IGW
resource "aws_internet_gateway" "main" {
  count = var.create_igw ? 1 : 0

  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.igw_tag
  }
}

##Route Table
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.route_table_tag
  }
}

resource "aws_route" "igw_route" {
  count = var.create_igw_route ? 1 : 0

  route_table_id = aws_route_table.main.id
  gateway_id = aws_internet_gateway.main[0].id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "public_subnets_route_association" {
  count = length(var.public_subnet_cidrs)

  route_table_id = aws_route_table.main.id
  subnet_id = element(aws_subnet.public_subnets[*].id, count.index)
}
