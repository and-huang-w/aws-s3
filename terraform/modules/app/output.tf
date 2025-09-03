output "object_etags" {
  value = {
    for k, v in aws_s3_object.bucket-objects : k => v.etag
  }
}

output "object_keys" {
  value = keys(aws_s3_object.bucket-objects)
}
