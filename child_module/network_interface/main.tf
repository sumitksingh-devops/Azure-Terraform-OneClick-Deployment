data "azurerm_resource_group" "rg" {

  for_each = var.nics

  name = each.value.resource_group_name

}

data "azurerm_subnet" "subnet" {

  for_each = var.nics

  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name

}

data "azurerm_public_ip" "pip" {

  for_each = var.nics

  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name

}

resource "azurerm_network_interface" "nic" {

  for_each = var.nics

  name                = each.value.nic_name
  location            = data.azurerm_resource_group.rg[each.key].location
  resource_group_name = data.azurerm_resource_group.rg[each.key].name

  ip_configuration {

    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id

  }

}