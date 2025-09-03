resource "aws_s3_object" "bucket-objects" {
#   depends_on = [
#     aws_s3_bucket_acl.bucket-acl,
#   ]
  bucket       = var.bucket_id
  for_each     = fileset("./modules/app/objects/", "*")
  key          = each.value
  source       = "./modules/app/objects/${each.value}"
  content_type = "text/html"
  etag         = md5(file("./modules/app/objects/${each.value}"))
}