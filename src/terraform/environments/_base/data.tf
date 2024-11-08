data "aws_route53_zone" "host" {
  name         = var.root_domain_name
  private_zone = false
}