resource "aws_security_group" "lifree-rds-sg" {
    description = "RDS security group for lifree"
    name        = "lifree-rds-sg"
    vpc_id      = aws_vpc.lifree-vpc.id
}

resource "aws_security_group" "lifree-alb-sg" {
    name        = "lifree-alb-sg"
    description = "ALB security group for lifree"
    vpc_id      = aws_vpc.lifree-vpc.id
}

resource "aws_security_group" "lifree-ecs-sg" {
    vpc_id      = aws_vpc.lifree-vpc.id
    name        = "lifree-ecs-sg"
    description = "ECS service security group for lifree"
}