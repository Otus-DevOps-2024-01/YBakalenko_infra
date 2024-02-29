variable "cloud_id" {
  description = "MyCloudID"
  type        = string
}
variable "folder_id" {
  description = "MyFolderID"
  type        = string
}
variable "zone" {
  description = "MyZone"
  # Значение по умолчанию
  default = "ru-central1-a"
  type        = string
}
variable "public_key_path" {
  description = "../.ssh/ubuntu.pub"
  type        = string
}
variable "image_id" {
  description = "MyImageID"
  type        = string
}
variable "subnet_id" {
  description = "MySubnetID"
  type        = string
}
variable "service_account_key_file" {
  description = "key.json"
  type        = string
}
variable "private_key_path" {
  description = "../.ssh/ubuntu"
  type        = string
}
