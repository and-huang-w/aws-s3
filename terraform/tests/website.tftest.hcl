run "setup_tests" {
    module {
        source = "./tests/setup"
    }
}

run "create_bucket" {
  command = apply

  variables {
    bucket_name = "${run.setup_tests.bucket_prefix}-aws-s3-website-test"
  }

  assert {
    condition     = aws_s3_bucket.bucket.bucket == "${run.setup_tests.bucket_prefix}-aws-s3-website-test"
    error_message = "Invalid bucket name"
  }

  assert {
    condition     = aws_s3_bucket_website_configuration.bucket-website-configuration.index_document[0].suffix == "index.html"
    error_message = "Index document should be index.html"
  }

  assert {
    condition     = aws_s3_bucket_website_configuration.bucket-website-configuration.error_document[0].key == "error.html"
    error_message = "Error document should be error.html"
  }

  assert {
    condition     = aws_s3_bucket_versioning.bucket-versioning.versioning_configuration[0].status == "Enabled"
    error_message = "Bucket versioning should be enabled"
  }

  assert {
    condition     = aws_s3_bucket_ownership_controls.bucket-ownership.rule[0].object_ownership == "BucketOwnerEnforced"
    error_message = "Bucket ownership should be BucketOwnerEnforced"
  }

  assert {
    condition     = can(aws_s3_bucket_policy.bucket-policy.policy)
    error_message = "Bucket policy should be defined"
  }

  assert {
    condition     = contains(keys(aws_s3_object.bucket-objects), "index.html")
    error_message = "index.html object should exist"
  }

  assert {
    condition     = contains(keys(aws_s3_object.bucket-objects), "error.html")
    error_message = "error.html object should exist"
  }

  assert {
    condition     = aws_s3_object.bucket-objects["index.html"].content_type == "text/html"
    error_message = "index.html should have text/html content type"
  }

  assert {
    condition     = aws_s3_object.bucket-objects["error.html"].content_type == "text/html"
    error_message = "error.html should have text/html content type"
  }
}