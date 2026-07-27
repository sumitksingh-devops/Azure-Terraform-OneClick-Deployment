data "azurerm_network_interface" "nic" {

  for_each = var.associations

  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name

}

data "azurerm_network_security_group" "nsg" {

  for_each = var.associations

  name                = each.value.nsg_name
  resource_group_name = each.value.resource_group_name

}

resource "azurerm_network_interface_security_group_association" "association" {

  for_each = var.associations

  network_interface_id      = data.azurerm_network_interface.nic[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg[each.key].id

}