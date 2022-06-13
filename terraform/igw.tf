resource "aws_internet_gateway" "lifree-igw" {
    vpc_id = aws_vpc.lifree-vpc.id
    
    tags = {
        Name = "lifree-igw"
    }
}