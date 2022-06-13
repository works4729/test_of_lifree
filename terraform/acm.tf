resource "aws_acm_certificate" "lifree-acm" {
    domain_name = aws_route53_record.lifree-host-zone-recode.name
    subject_alternative_names = []
    validation_method = "DNS"
    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_route53_record" "lifree-certificate" {
    name    = tolist(aws_acm_certificate.lifree-acm.domain_validation_options)[0].resource_record_name
    type    = tolist(aws_acm_certificate.lifree-acm.domain_validation_options)[0].resource_record_type
    records = [tolist(aws_acm_certificate.lifree-acm.domain_validation_options)[0].resource_record_value]
    zone_id = aws_route53_zone.lifree-host-zone.id
    ttl     = 60
}

resource "aws_acm_certificate_validation" "lifree-acm" {
    certificate_arn         = aws_acm_certificate.lifree-acm.arn
    validation_record_fqdns = [aws_route53_record.lifree-certificate.fqdn]
}