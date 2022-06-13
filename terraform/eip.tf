resource "aws_eip" "lifree-ngw-eip" {
    vpc = true
    depends_on = [aws_internet_gateway.lifree-igw]
    
    tags = {
        Name = "lifree-ngw-eip"
    }
}