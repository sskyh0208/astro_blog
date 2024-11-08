locals {
  env_name = "common"

  prefix_name = "${var.product_name}-${local.env_name}"
  
  domain_name  = ""
  host_zone_id = data.aws_route53_zone.host.zone_id

  enable_cloudfront_basic_auth = true
}