locals {
  env_name = "prod"

  prefix_name = "${var.product_name}-${local.env_name}"
  
  domain_name  = "blog.${var.root_domain_name}"
  host_zone_id = data.aws_route53_zone.host.zone_id
}