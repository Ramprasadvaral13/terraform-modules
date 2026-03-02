resource "aws_vpc" "test" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true
    enable_dns_support = true
    
}

resource "aws_internet_gateway" "test-igw" {
    vpc_id = aws_vpc.test.id
  
}

resource "aws_subnet" "test-subnet" {
    vpc_id = aws_vpc.test.id
    for_each = var.subnet
    cidr_block = each.value.cidr
    availability_zone = each.value.az
    map_public_ip_on_launch = each.value.public
}

resource "aws_route_table" "public-route" {
    vpc_id = aws_vpc.test.id
    route {
        gateway_id = aws_internet_gateway.test-igw.id
        cidr_block = var.route_cidr
    }
  
}

resource "aws_route_table_association" "public-rtba" {
    route_table_id = aws_route_table.public-route.id
    for_each = { for k,s in var.subnet : k=>s if s.public == true }
    subnet_id = aws_subnet.test-subnet[each.key].id
  
}