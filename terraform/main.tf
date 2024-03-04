terraform {

  #backend "s3" {
  #  endpoint   = "storage.yandexcloud.net"
  #  bucket     = "reddit"
  #  region     = "ru-central1"
  #  key        = "remote/reddit.tfstate"

  #  access_key = "YCAJE4nCjM798ylmxQXcUoEmn"
  #  secret_key = "YCMQqX7ER_YK1YmcfgpHHsxBR54Z8XDBlES3cwq4"

  #  skip_region_validation      = true
  #  skip_credentials_validation = true
  #}
}

provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

module "app" {
  source          = "./modules/app"
  public_key_path = var.public_key_path
  app_disk_image  = var.app_disk_image
  subnet_id       = module.vpc.vpc_subnet_id
}

module "db" {
  source          = "./modules/db"
  public_key_path = var.public_key_path
  db_disk_image   = var.db_disk_image
  subnet_id       = module.vpc.vpc_subnet_id
}

module "vpc" {
  source          = "./modules/vpc"
}
