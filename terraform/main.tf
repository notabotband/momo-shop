locals {
  service_account_name     = "momo"
}

module "yandex_cloud_instance" {
  source = "./modules/tf-yc-instance"
}

module "yandex_cloud_network" {
  source = "./modules/tf-yc-network"
}

resource "yandex_iam_service_account" "momo" {
  name        = local.service_account_name
  description = "service account"
}

resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.momo.id
  description        = "static access key for object storage"
}

resource "yandex_storage_bucket" "momobucket" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket = "momo-store-pictures"
  acl    = "public-read"
}