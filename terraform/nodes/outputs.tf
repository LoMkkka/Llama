output "access_ip" {
  value = openstack_compute_instance_v2.server_tf.*.access_ip_v4
}

