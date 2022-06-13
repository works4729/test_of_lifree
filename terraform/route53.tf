resource "aws_route53_zone" "lifree-host-zone" {
    name = "lifree.site"
    comment = "lifree.site host zone"
}

resource "aws_route53_record" "lifree-host-zone-recode" {
    zone_id = aws_route53_zone.lifree-host-zone.zone_id
    name = aws_route53_zone.lifree-host-zone.name
    type = "A"
    
    alias {
        name                   = aws_lb.lifree-alb.dns_name
        zone_id                = aws_lb.lifree-alb.zone_id
        evaluate_target_health = true
    }
}