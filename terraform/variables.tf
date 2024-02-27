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
  # Описание переменной
  description = "PubKeyFilePath"
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
  description = "SAKeyFilePath"
  type        = string
}
variable "private_key_path" {
  description = "PrivateKeyFilePath"
  type        = string
}
