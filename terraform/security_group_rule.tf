#########################
# SecurityGroupRule RDS #
#########################
resource "aws_security_group_rule" "lifree-rds-sg-rule1" {
  description       = "lifree rds sg rule"
  type              = "ingress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0", "0.0.0.0/16"]
  security_group_id = aws_security_group.lifree-rds-sg.id
}
resource "aws_security_group_rule" "lifree-rds-sg-rule2" {
  description       = "lifree rds sg rule2"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.lifree-rds-sg.id
}
resource "aws_security_group_rule" "lifree-rds-sg-rule3" {
  description       = "lifree rds sg rule3"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.lifree-rds-sg.id
}

resource "aws_security_group_rule" "lifree-alb-sg-rule1" {
  description       = "lifree-alb-sg-rule1"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.lifree-alb-sg.id
}
resource "aws_security_group_rule" "lifree-alb-sg-rule2" {
  description       = "lifree-alb-sg-rule2"
  type              = "ingress"
  from_port         = 8
  to_port           = 0
  protocol          = "icmp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.lifree-alb-sg.id
}
resource "aws_security_group_rule" "lifree-alb-sg-rule3" {
  description       = "lifree-alb-sg-rule3"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.lifree-alb-sg.id
}
resource "aws_security_group_rule" "lifree-alb-sg-rule4" {
  description       = "lifree-alb-sg-rule4"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.lifree-alb-sg.id
}
resource "aws_security_group_rule" "lifree-alb-sg-rule5" {
  description       = "lifree-alb-sg-rule5"
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.lifree-alb-sg.id
}
resource "aws_security_group_rule" "lifree-alb-sg-rule6" {
  description       = "lifree-alb-sg-rule6"
  type              = "ingress"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.lifree-alb-sg.id
}

#########################
# SecurityGroupRule ECS #
#########################
resource "aws_security_group_rule" "lifree-ecs-sg-rule1" {
  description       = "lifree-ecs-sg-rule1"
  type              = "ingress"
  from_port         = 8
  to_port           = 0
  protocol          = "icmp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.lifree-ecs-sg.id
}
resource "aws_security_group_rule" "lifree-ecs-sg-rule2" {
  description       = "lifree-ecs-sg-rule2"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.lifree-ecs-sg.id
}
resource "aws_security_group_rule" "lifree-ecs-sg-rule3" {
  description       = "lifree-ecs-sg-rule3"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.lifree-ecs-sg.id
}
resource "aws_security_group_rule" "lifree-ecs-sg-rule4" {
  description       = "lifree-ecs-sg-rule4"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.lifree-ecs-sg.id
}
resource "aws_security_group_rule" "lifree-ecs-sg-rule5" {
  description              = "lifree-ecs-sg-rule5"
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.lifree-alb-sg.id
  security_group_id        = aws_security_group.lifree-ecs-sg.id
}
resource "aws_security_group_rule" "lifree-ecs-sg-rule6" {
  description       = "lifree-ecs-sg-rule6"
  type              = "ingress"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.lifree-ecs-sg.id
}
resource "aws_security_group_rule" "lifree-ecs-sg-rule7" {
  description       = "lifree-ecs-sg-rule5"
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.lifree-ecs-sg.id
}