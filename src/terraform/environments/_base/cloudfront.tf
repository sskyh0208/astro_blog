###############################################################################
# CloudFront
###############################################################################
resource "aws_acm_certificate_validation" "web_hosting" {
  provider        = aws.virginia
  certificate_arn = aws_acm_certificate.web_hosting.arn
  validation_record_fqdns = [
    for record in aws_route53_record.web_hosting_acm : record.fqdn
  ]
}

resource "aws_cloudfront_distribution" "web_hosting" {
  depends_on = [ aws_acm_certificate_validation.web_hosting ]
  
  comment = "${var.product_name}のBlogコンテンツを配信するCloudFront"

  origin {
    domain_name              = aws_s3_bucket.web_origin.bucket_regional_domain_name
    origin_id                = aws_s3_bucket.web_origin.id
    origin_access_control_id = aws_cloudfront_origin_access_control.web_origin.id
  }

  aliases = [ local.domain_name ]

  enabled             = true
  default_root_object = "index.html"

  default_cache_behavior {
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = aws_s3_bucket.web_origin.id
    viewer_protocol_policy = "redirect-to-https"

    function_association {
      event_type = "viewer-request"
      function_arn = aws_cloudfront_function.static_router.arn
    }
  }

  custom_error_response {
    error_code            = 403
    response_code         = 200
    response_page_path    = "/index.html"
  }

  custom_error_response {
    error_code            = 404
    response_code         = 200
    response_page_path    = "/index.html"
  }

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations = [
        "JP"
      ]
    }
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.web_hosting.arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }

  price_class = "PriceClass_200"
}

resource "aws_cloudfront_origin_access_control" "web_origin" {
  name                              = aws_s3_bucket.web_origin.bucket_regional_domain_name
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_function" "static_router" {
  name        = "${local.prefix_name}-cf-static-router"
  comment     = "静的ホスティング用のパス変換"
  runtime     = "cloudfront-js-2.0"
  publish     = true

  code = file("../../lambda/static_router/main.js")
}