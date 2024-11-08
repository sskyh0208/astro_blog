###############################################################################
# Route53 カスタムドメインがある場合のみ
###############################################################################
resource "aws_route53_record" "web_hosting" {
  name    = local.domain_name
  zone_id = local.host_zone_id
  type    = "A"

  alias {
    name    = aws_cloudfront_distribution.web_hosting.domain_name
    zone_id = aws_cloudfront_distribution.web_hosting.hosted_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "web_hosting_acm" {
  for_each = {
    for dvo in aws_acm_certificate.web_hosting.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [ each.value.record ]
  ttl             = 300
  type            = each.value.type
  zone_id         = local.host_zone_id
}
