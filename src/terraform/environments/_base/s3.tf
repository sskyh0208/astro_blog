resource "aws_s3_bucket" "web_origin" {
  bucket = "${local.prefix_name}-web-origin"
}

resource "aws_s3_bucket_policy" "web_origin" {
  bucket = aws_s3_bucket.web_origin.bucket
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow"
        # CloudFrontからのアクセスを許可
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action    = "s3:GetObject"
        Resource  = [
          aws_s3_bucket.web_origin.arn,
          "${aws_s3_bucket.web_origin.arn}/*"
        ]
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = aws_cloudfront_distribution.web_hosting.arn
          }
        }
      }
    ]
  })
}