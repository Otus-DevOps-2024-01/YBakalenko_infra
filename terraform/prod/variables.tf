variable "cloud_id" {
  description = "MyCloudID"
  type        = string
}

variable "folder_id" {
  description = "MyFolderID"
  type        = string
}

variable "zone" {
  description = "ru-central1-a"
  # Значение по умолчанию
  default = "ru-central1-a"
  type    = string
}

variable "public_key_path" {
  description = "../.ssh/ubuntu.pub"
  type        = string
}

variable "app_disk_image" {
  description = "Disk image for reddit app"
  default = "reddit-app-base"
}

variable "db_disk_image" {
  description = "Database image for reddit app"
  default = "reddit-db-base"
}

variable "service_account_key_file" {
  description = "key.json"
  type        = string
}
