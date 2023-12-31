resource "yandex_compute_instance" "vm-1" {
  name = var.name
  platform_id = var.platform_id
  zone        = var.zone

  resources {
    cores = var.cores
    memory = var.memory
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat = false
  }

  scheduling_policy {
    preemptible = true
  }

  metadata = {
    user-data = "${file("../scripts/add-ssh-web-app.yaml")}"
  }
}
