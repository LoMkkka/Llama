terraform {
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
  }
}

module "master" {
  source = "./master"
}

module "nodes" {
  source = "./nodes"
}