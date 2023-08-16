output "yandex_vpc_network" {
  description = "Yandex.Cloud network map"
  value       = data.yandex_vpc_network.default
}

output "yandex_vpc_subnets" {
  description = "Yandex.Cloud Subnets map"
  value       = data.yandex_vpc_subnet.default
}
