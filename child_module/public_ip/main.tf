data "azurerm_resource_group" "rg" {

  for_each = var.public_ips

  name = each.value.resource_group_name

}

resource "azurerm_public_ip" "pip" {

  for_each = var.public_ips

  name                = each.value.public_ip_name
  location            = data.azurerm_resource_group.rg[each.key].location
  resource_group_name = data.azurerm_resource_group.rg[each.key].name
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku

}