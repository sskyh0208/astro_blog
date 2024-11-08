resource "aws_ssm_parameter" "web_origin_bucket_name" {
  name        = "/${var.product_name}/${local.env_name}/s3/web_origin/bucket_name"
  type        = "String"
  value       = aws_s3_bucket.web_origin.bucket
  description = "${local.env_name}のWeb Origin S3 Bucket名"
}

resource "aws_ssm_parameter" "web_origin_bucket_arn" {
  name        = "/${var.product_name}/${local.env_name}/s3/web_origin/bucket_arn"
  type        = "String"
  value       = aws_s3_bucket.web_origin.arn
  description = "${local.env_name}のWeb Origin S3 Bucket ARN"
}

resource "aws_ssm_parameter" "web_hosting_distribution_id" {
  name        = "/${var.product_name}/${local.env_name}/cloudfront/web_hosting/distribution_id"
  type        = "String"
  value       = aws_cloudfront_distribution.web_hosting.id
  description = "${local.env_name}のWeb Hosting CloudFront Distribution ID"
}