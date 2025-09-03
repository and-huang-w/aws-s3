resource "aws_s3_object" "bucket-objects" {
#   depends_on = [
#     aws_s3_bucket_acl.bucket-acl,
#   ]
  bucket       = aws_s3_bucket.bucket.id
  for_each     = fileset("./modules/app/objects/", "*")
  key          = each.value
  source       = "./modules/app/objects/${each.value}"
  acl          = "public-read"
  content_type = "text/html"
  etag         = md5(file("./modules/app/objects/${each.value}"))
}