provider "google" {
project = "infra"
region = "europe-west1"
}
resource "google_compute_instance" "app" {
name = "reddit-app"
machine_type = "g1-small"
zone = "europe-west1-b"
tags = ["reddit-app"]
# определение загрузочного диска
boot_disk {
initialize_params {
image = ""
}
}
# определение сетевого интерфейса
network_interface {
# сеть, к которой присоединить данный интерфейс
network = "default"
# использовать ephemeral IP для доступа из Интернет
access_config = {
nat_ip = "${google_compute_address.app_ip.address}"
}
}
}
resource "google_compute_address" "app_ip" {
name = "reddit-app-ip"
}





