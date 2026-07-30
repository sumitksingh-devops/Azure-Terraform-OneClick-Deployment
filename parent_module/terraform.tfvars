rgs = {

  rg1 = {
    resource_group_name = "rg-dev"
    location            = "West US"
  }

}

vnets = {

  vnet1 = {
    vnet_name           = "vnet-dev"
    resource_group_name = "rg-dev"
    location            = "West US"
    address_space       = ["10.0.0.0/16"]
  }

}

subnets = {

  frontend = {
    subnet_name         = "frontend-subnet"
    resource_group_name = "rg-dev"
    vnet_name           = "vnet-dev"
    address_prefixes    = ["10.0.1.0/24"]
  }

  backend = {
    subnet_name         = "backend-subnet"
    resource_group_name = "rg-dev"
    vnet_name           = "vnet-dev"
    address_prefixes    = ["10.0.2.0/24"]
  }

}

public_ips = {

  pip1 = {
    public_ip_name      = "frontend-pip"
    resource_group_name = "rg-dev"
    location            = "West US"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}

nsgs = {

  nsg1 = {
    nsg_name            = "frontend-nsg"
    resource_group_name = "rg-dev"
    location            = "West US"
  }
}

nics = {

  nic1 = {
    nic_name            = "frontend-nic"
    resource_group_name = "rg-dev"
    vnet_name           = "vnet-dev"
    subnet_name         = "frontend-subnet"
    public_ip_name      = "frontend-pip"

  }
}


associations = {

  association1 = {
    nic_name            = "frontend-nic"
    nsg_name            = "frontend-nsg"
    resource_group_name = "rg-dev"
  }

}

vms = {

  vm1 = {
    vm_name             = "linux-vm"
    resource_group_name = "rg-dev"
    nic_name            = "frontend-nic"
    vm_size             = "Standard_D2s_v3"
    vm_username = "azureuser"
    vm_password = "Welcome@1234"
  }
}
