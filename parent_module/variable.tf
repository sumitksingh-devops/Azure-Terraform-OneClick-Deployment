variable "rgs" {

  type = map(object({

    resource_group_name = string
    location            = string

  }))

}

variable "vnets" {

  type = map(object({

    vnet_name           = string
    resource_group_name = string
    location            = string
    address_space       = list(string)

  }))

}

variable "subnets" {

  type = map(object({

    subnet_name         = string
    resource_group_name = string
    vnet_name           = string
    address_prefixes    = list(string)

  }))

}

variable "public_ips" {

  type = map(object({

    public_ip_name      = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    sku                 = string

  }))

}

variable "nsgs" {

  type = map(object({

    nsg_name            = string
    resource_group_name = string
    location            = string

  }))

}

variable "nics" {

  type = map(object({

    nic_name            = string
    resource_group_name = string
    vnet_name           = string
    subnet_name         = string
    public_ip_name      = string

  }))

}

variable "associations" {

  type = map(object({

    nic_name            = string
    nsg_name            = string
    resource_group_name = string

  }))

}


variable "vms" {

  type = map(object({

    vm_name             = string
    resource_group_name = string
    nic_name            = string
    vm_size             = string
    vm_username         = string
    vm_password         = string

  }))

}









