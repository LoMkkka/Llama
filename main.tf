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
  source = "./modules/master"
}

module "nodes" {
  source = "./modules/nodes"
}


