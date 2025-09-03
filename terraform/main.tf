module "infra" {
  source      = "./modules/infra"
  bucket_name = var.bucket_name
}

module "app" {
  source    = "./modules/app"
  bucket_id = module.infra.bucket_id
}