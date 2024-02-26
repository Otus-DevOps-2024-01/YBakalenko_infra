#output "external_ip_address_app" {
#  value = one(yandex_compute_instance.app[*].network_interface.0.nat_ip_address)
#}
