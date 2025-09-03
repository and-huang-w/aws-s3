output "bucket_id" {
  value = aws_s3_bucket.bucket.id
}

output "bucket_name" {
  value = aws_s3_bucket.bucket.bucket
}

output "bucket_website_domain" {
  value = aws_s3_bucket_website_configuration.bucket-website-configuration.website_endpoint
}

output "aws_s3_bucket_website_endpoint" {
  value = "http://${aws_s3_bucket_website_configuration.bucket-website-configuration.website_endpoint}"
}