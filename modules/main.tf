terraform {
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
    selectel = {
      source = "selectel/selectel"
    }
  }
}

module "master" {
  source = "./master"
}

module "nodes" {
  source = "./nodes"
}