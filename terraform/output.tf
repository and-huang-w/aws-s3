output "bucket_website_endpoint" {
  value = module.infra.aws_s3_bucket_website_endpoint
}

output "bucket_name" {
  value = module.infra.bucket_name
}

output "bucket_id" {
  value = module.infra.bucket_id
}
