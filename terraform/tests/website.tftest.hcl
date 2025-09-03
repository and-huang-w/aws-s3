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
    condition     = module.infra.bucket_name == "${run.setup_tests.bucket_prefix}-aws-s3-website-test"
    error_message = "Invalid bucket name"
  }

  assert {
    condition     = module.infra.bucket_website_domain != ""
    error_message = "Website domain should be configured"
  }

  assert {
    condition     = contains(keys(module.app.object_etags), "index.html")
    error_message = "index.html object should exist"
  }

  assert {
    condition     = contains(keys(module.app.object_etags), "error.html")
    error_message = "error.html object should exist"
  }
}