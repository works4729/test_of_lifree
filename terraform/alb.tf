resource "aws_lb" "lifree-alb" {
    name = "lifree-alb"
    load_balancer_type = "application"
    internal = false
    idle_timeout = 60
    enable_deletion_protection = false
    
    subnets = [
        aws_subnet.lifree-public-1a.id,
        aws_subnet.lifree-public-1c.id
    ]
    
    security_groups = [
        aws_security_group.lifree-alb-sg.id
    ]
    
    tags = {
        Name = "lifree-alb"
    }
}

resource "aws_lb_listener" "lifree-http-listener" {
    load_balancer_arn = aws_lb.lifree-alb.arn
    port = "80"
    protocol = "HTTP"
    
    default_action {
        type = "redirect"
        
        redirect {
            port = "443"
            protocol = "HTTPS"
            status_code = "HTTP_301"
        }
        
        # type = "fixed-response"
        # fixed_response {
        #     content_type = "text/plain"
        #     message_body = "これは『HTTP』です"
        #     status_code = "200"
        # }
    }
}

resource "aws_lb_listener" "lifree-https-listener" {
    load_balancer_arn = aws_lb.lifree-alb.arn
    port = "443"
    protocol = "HTTPS"
    certificate_arn = aws_acm_certificate.lifree-acm.arn
    
    default_action {
        target_group_arn = aws_lb_target_group.lifree-alb-front-tg.arn
        type = "forward"
    }
}

resource "aws_lb_listener" "lifree-api-listener" {
    load_balancer_arn = aws_lb.lifree-alb.arn
    port = "3000"
    protocol = "HTTPS"
    certificate_arn = aws_acm_certificate.lifree-acm.arn
    
    default_action {
        target_group_arn = aws_lb_target_group.lifree-alb-api-tg.arn
        type = "forward"
    }
}

resource "aws_lb_target_group" "lifree-alb-front-tg" {
    name = "lifree-alb-front-tg"
    target_type = "ip"
    vpc_id = aws_vpc.lifree-vpc.id
    port = 80
    protocol = "HTTP"
    
    health_check {
        enabled = true
        path = "/"
        healthy_threshold = 2
        unhealthy_threshold = 2
        timeout = 120
        interval = 150
        matcher = 200
        port = 80
        protocol = "HTTP"
    }
}

resource "aws_lb_target_group" "lifree-alb-api-tg" {
    name = "lifree-alb-api-tg"
    target_type = "ip"
    vpc_id = aws_vpc.lifree-vpc.id
    port = 3000
    protocol = "HTTP"
    
    health_check {
        enabled = true
        path = "/api/v1/tasks"
        healthy_threshold = 5
        unhealthy_threshold = 2
        timeout = 50
        interval = 60
        matcher = 200
        port = 3000
        protocol = "HTTP"
    }
}

