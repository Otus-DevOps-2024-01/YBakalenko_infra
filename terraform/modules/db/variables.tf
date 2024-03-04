variable public_key_path {
  description = "../../../.ssh/ubuntu.pub"
  type        = string
}

variable db_disk_image {
  description = "Disk image for reddit database"
  default     = "reddit-db-base"
  type        = string
}

variable subnet_id {
  description = "MySubnetID"
  type        = string
}
