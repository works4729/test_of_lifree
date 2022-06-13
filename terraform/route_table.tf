resource "aws_route_table" "lifree-public-rtb" {
    vpc_id = aws_vpc.lifree-vpc.id
    
    route {
        gateway_id = aws_internet_gateway.lifree-igw.id
        cidr_block = "0.0.0.0/0"
    }
    
    tags = {
        Name = "lifree-public-route"
    }
}

resource "aws_route_table" "lifree-private-rtb" {
    vpc_id = aws_vpc.lifree-vpc.id
    
    route {
        nat_gateway_id = aws_nat_gateway.lifree-ngw.id
        cidr_block = "0.0.0.0/0"
    }
    
    tags = {
        Name = "lifree-private-route"
    }
}

resource "aws_route_table_association" "lifree-public-rtb-1a" {
    subnet_id = aws_subnet.lifree-public-1a.id
    route_table_id = aws_route_table.lifree-public-rtb.id
}

resource "aws_route_table_association" "lifree-public-rtb-1c" {
    subnet_id = aws_subnet.lifree-public-1c.id
    route_table_id = aws_route_table.lifree-public-rtb.id
}

resource "aws_route_table_association" "lifree-private-rtb-1a" {
    subnet_id = aws_subnet.lifree-private-1a.id
    route_table_id = aws_route_table.lifree-private-rtb.id
}

resource "aws_route_table_association" "lifree-private-rtb-1c" {
    subnet_id = aws_subnet.lifree-private-1c.id
    route_table_id = aws_route_table.lifree-private-rtb.id
}
