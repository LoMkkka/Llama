output "floating_address" {
  value = openstack_networking_floatingip_v2.fip_tf.address
}

output "router_ip" {
  value = openstack_networking_router_v2.router_tf.external_fixed_ip
}

output "gateway_ip" {
  value = openstack_networking_subnet_v2.subnet_tf.gateway_ip
}