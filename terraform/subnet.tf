resource "aws_subnet" "lifree-public-1a" {
    vpc_id = aws_vpc.lifree-vpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "ap-northeast-1a"
    map_public_ip_on_launch = true
        
    tags = {
        Name = "lifree-public-1a"
    }
}

resource "aws_subnet" "lifree-public-1c" {
    vpc_id = aws_vpc.lifree-vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-northeast-1c"
    map_public_ip_on_launch = true
        
    tags = {
        Name = "lifree-public-1c"
    }
}

resource "aws_subnet" "lifree-private-1a" {
    vpc_id = aws_vpc.lifree-vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-northeast-1a"
    map_public_ip_on_launch = true
        
    tags = {
        Name = "lifree-private-1a"
    }
}

resource "aws_subnet" "lifree-private-1c" {
    vpc_id = aws_vpc.lifree-vpc.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "ap-northeast-1c"
    map_public_ip_on_launch = true
    
    tags = {
        Name = "lifree-private-1c"
    }
}

resource "aws_db_subnet_group" "lifree-rds-subnet-group" {
    name = "lifree-rds-subnet-group"
    description = "rds subnet for lifree"
    subnet_ids = [aws_subnet.lifree-private-1a.id, aws_subnet.lifree-private-1c.id]
}