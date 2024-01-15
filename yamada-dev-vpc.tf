resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = merge(
    var.common_tags,
    {
      Name = "${var.application-vpc}"
    }
  )
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags   = var.common_tags
}

resource "aws_subnet" "public_subnet" {
  count = length(var.availability_zones)

  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "11.0.${count.index}.0/24"
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  tags = merge(
    var.common_tags,
    {
      Name = "school-public-subnet-${count.index + 1}"
    }
  )
}

resource "aws_subnet" "private_subnet" {
  count = length(var.availability_zones)

  vpc_id      = aws_vpc.my_vpc.id
  cidr_block  = "11.0.${count.index + 2}.0/24"
  availability_zone = var.availability_zones[count.index]
  tags = merge(
    var.common_tags,
    {
      Name = "school-private-subnet-${count.index + 1}"
    }
  )
}

resource "aws_route_table" "public_route_table" {
  count = length(var.availability_zones)

  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = var.public_access
    gateway_id = aws_internet_gateway.my_igw.id
  }
  tags = merge(
    var.common_tags,
    {
      Name = "school-public-route-table-${count.index + 1}"
    }
  )
}

resource "aws_route_table_association" "public_route_table_association" {
  count = length(var.availability_zones)

  subnet_id      = "${aws_subnet.public_subnet[count.index].id}"
  route_table_id = "${aws_route_table.public_route_table[count.index].id}"
}

resource "aws_route_table" "private_route_table" {
  count = length(var.availability_zones)

  vpc_id = aws_vpc.my_vpc.id
  tags = merge(
    var.common_tags,
    {
      Name = "school-private-route-table-${count.index + 1}"
    }
  )
}

resource "aws_route_table_association" "private_route_table_association" {
  count = length(var.availability_zones)

  subnet_id      = "${aws_subnet.private_subnet[count.index].id}"
  route_table_id = "${aws_route_table.private_route_table[count.index].id}"
}