###############################################################################
# ACM (virginia) カスタムドメインがある場合のみ
###############################################################################
resource "aws_acm_certificate" "web_hosting" {
  provider          = aws.virginia
  domain_name       = local.domain_name
  validation_method = "DNS"
}