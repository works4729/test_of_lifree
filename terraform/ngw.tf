resource "aws_nat_gateway" "lifree-ngw" {
    allocation_id = aws_eip.lifree-ngw-eip.id
    subnet_id = aws_subnet.lifree-public-1a.id
    depends_on = [aws_internet_gateway.lifree-igw]
    
    tags = {
        Name = "lifree-ngw"
    }
}