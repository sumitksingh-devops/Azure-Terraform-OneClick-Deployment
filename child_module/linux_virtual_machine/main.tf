data "azurerm_resource_group" "rg" {

  for_each = var.vms

  name = each.value.resource_group_name
}

data "azurerm_network_interface" "nic" {

  for_each = var.vms

  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_linux_virtual_machine" "vm" {

  for_each = var.vms

  name                = each.value.vm_name
  location            = data.azurerm_resource_group.rg[each.key].location
  resource_group_name = data.azurerm_resource_group.rg[each.key].name
  size                = each.value.vm_size

  admin_username = each.value.vm_username
  admin_password = each.value.vm_password

  disable_password_authentication = false

  network_interface_ids = [
    data.azurerm_network_interface.nic[each.key].id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}