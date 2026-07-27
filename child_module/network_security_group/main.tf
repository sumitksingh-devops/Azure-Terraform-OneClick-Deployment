data "azurerm_resource_group" "rg" {

  for_each = var.nsgs

  name = each.value.resource_group_name

}

resource "azurerm_network_security_group" "nsg" {

  for_each = var.nsgs

  name                = each.value.nsg_name
  location            = data.azurerm_resource_group.rg[each.key].location
  resource_group_name = data.azurerm_resource_group.rg[each.key].name

}