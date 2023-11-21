
# Запрос ID внешней сети по имени
data "openstack_networking_network_v2" "external_net" {
  name = "external-network"
}

# Создание роутера
resource "openstack_networking_router_v2" "router_tf" {
  name                = "router_master"
  external_network_id = data.openstack_networking_network_v2.external_net.id
}

# Создание сети
resource "openstack_networking_network_v2" "network_tf" {
  name = "network_tf"
}

# Создание подсети
resource "openstack_networking_subnet_v2" "subnet_tf" {
  network_id = openstack_networking_network_v2.network_tf.id
  name       = "subnet_tf"
  cidr       = var.subnet_cidr
}

#Подключение роутера к подсети
resource "openstack_networking_router_interface_v2" "router_interface_tf" {
  router_id = openstack_networking_router_v2.router_tf.id
  subnet_id = openstack_networking_subnet_v2.subnet_tf.id
}

# Создание публичного IP-адреса
resource "openstack_networking_floatingip_v2" "fip_tf" {
  pool = "external-network"
}

# Привязка публичного IP-адреса к серверу
resource "openstack_compute_floatingip_associate_v2" "fip_tf" {
  floating_ip = openstack_networking_floatingip_v2.fip_tf.address
  instance_id = openstack_compute_instance_v2.server_tf.id
}
