output "access_ip" {
  value = openstack_compute_instance_v2.server_tf.*.access_ip_v4
}

# output "status_ip_addresses" {
#   value = {
#     for status in openstack_compute_instance_v2.server_tf :
#     status.name => status.access_ip_v4
#   }
# }
