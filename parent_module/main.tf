module "resource_group" {

  source = "../child_module/resource_group"

  rgs = var.rgs

}

module "virtual_network" {

  source = "../child_module/virtual_network"

  vnets = var.vnets

  depends_on = [
    module.resource_group
  ]

}

module "subnet" {

  source = "../child_module/subnet"

  subnets = var.subnets

  depends_on = [
    module.virtual_network
  ]

}

module "public_ip" {

  source = "../child_module/public_ip"

  public_ips = var.public_ips

  depends_on = [
    module.resource_group
  ]

}

module "network_security_group" {

  source = "../child_module/network_security_group"

  nsgs = var.nsgs

  depends_on = [
    module.resource_group
  ]

}

module "network_interface" {

  source = "../child_module/network_interface"

  nics = var.nics

  depends_on = [
    module.subnet,
    module.public_ip
  ]

}

module "nsg_association" {

  source = "../child_module/nsg_association"

  associations = var.associations

  depends_on = [
    module.network_interface,
    module.network_security_group
  ]

}

module "linux_virtual_machine" {

  source = "../child_module/linux_virtual_machine"

  vms = var.vms

  depends_on = [
    module.network_interface
  ]
}