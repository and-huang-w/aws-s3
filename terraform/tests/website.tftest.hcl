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
    error_message = "Nome de bucket inválido"
  }

  assert {
    condition     = module.infra.bucket_website_domain != ""
    error_message = "O domínio do site deve ser configurado"
  }

  assert {
    condition     = contains(keys(module.app.object_etags), "index.html")
    error_message = "O objeto index.html deve existir"
  }

  assert {
    condition     = contains(keys(module.app.object_etags), "error.html")
    error_message = "O objeto error.html deve existir"
  }
}