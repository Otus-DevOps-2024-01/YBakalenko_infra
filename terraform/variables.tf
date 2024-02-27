variable "cloud_id" {
  description = "MyCloudID"
}
variable "folder_id" {
  description = "MyFolderID"
}
variable "zone" {
  description = "MyZone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable "public_key_path" {
  # Описание переменной
  description = "PubKeyFilePath"
}
variable "image_id" {
  description = "MyImageID"
}
variable "subnet_id" {
  description = "MySubnetID"
}
variable "service_account_key_file" {
  description = "SAKeyFilePath"
}
variable "private_key_path" {
  description = "PrivateKeyFilePath"
}
