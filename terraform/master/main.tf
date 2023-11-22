terraform {
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
  }
}

resource "openstack_compute_keypair_v2" "key_tf" {
  name       = "master_key"
  public_key = var.public_key
  
}


# Поиск ID образа (из которого будет создан сервер) по его имени
data "openstack_images_image_v2" "ubuntu_image" {
  most_recent = true
  visibility  = "public"
  name        = "Ubuntu 20.04 LTS 64-bit"
}

# Создание уникального имени флейвора
resource "random_string" "random_name_server" {
  length  = 16
  special = false
}

# Создание конфигурации сервера с 1 ГБ RAM и 1 vCPU
# Параметр disk = 0  делает сетевой диск загрузочным
resource "openstack_compute_flavor_v2" "flavor_server" {
  name      = "server-${random_string.random_name_server.result}"
  ram       = var.rams
  vcpus     = var.vCPU
  disk      = "0"
  is_public = "false"
}

# Создание сетевого загрузочного диска размером 5 ГБ из образа
resource "openstack_blockstorage_volume_v3" "volume_server" {
  name                 = "volume-for-server"
  size                 = "11"
  image_id             = data.openstack_images_image_v2.ubuntu_image.id
  volume_type          = var.volume_type
  availability_zone    = var.az_zone
  enable_online_resize = true
  lifecycle {
    ignore_changes = [image_id]
  }
}

# Создание сервера
resource "openstack_compute_instance_v2" "server_tf" {
  name              = "Master"
  flavor_id         = openstack_compute_flavor_v2.flavor_server.id
  key_pair          = openstack_compute_keypair_v2.key_tf.id
  availability_zone = var.az_zone

  
  network {
    uuid = openstack_networking_network_v2.network_tf.id
  }
  block_device {
    uuid             = openstack_blockstorage_volume_v3.volume_server.id
    source_type      = "volume"
    destination_type = "volume"
    boot_index       = 0
  }
  vendor_options {
    ignore_resize_confirmation = true
  }
  lifecycle {
    ignore_changes = [image_id]
  }


}
