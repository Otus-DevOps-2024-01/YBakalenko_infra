variable public_key_path {
  description = "../../../.ssh/ubuntu.pub"
  type        = string
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
  type        = string
}

variable subnet_id {
  description = "MySubnetID"
  type        = string
}
