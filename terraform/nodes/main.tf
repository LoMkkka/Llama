terraform {
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
  }
}

# Поиск ID образа (из которого будет создан сервер) по его имени
data "openstack_images_image_v2" "ubuntu_image" {
  most_recent = true
  visibility  = "public"
  name        = "Ubuntu 18.04 LTS 64-bit"
}

# Создание уникального имени флейвора
resource "random_string" "random_name_server" {
  length  = 16
  special = false
}


# Создание конфигурации сервера
# Параметр disk = 0  делает сетевой диск загрузочным
resource "openstack_compute_flavor_v2" "flavor_server" {
  name      = "server-node-${random_string.random_name_server.result}"
  ram       = var.rams
  vcpus     = var.vCPU
  disk      = "0"
  is_public = "false"
}

# Создание сетевого загрузочного диска размером 5 ГБ из образа
resource "openstack_blockstorage_volume_v3" "volume_server" {
  count                = var.int_count
  name                 = "volume-for-server${count.index}"
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
  count             = var.int_count
  name              = "node-${count.index + 1}"
  key_pair          = "master_key"
  flavor_id         = openstack_compute_flavor_v2.flavor_server.id
  availability_zone = var.az_zone
  network {
    name = "network_tf"
  }

  block_device {
    uuid             = openstack_blockstorage_volume_v3.volume_server[count.index].id
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
