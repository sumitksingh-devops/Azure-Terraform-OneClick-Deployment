variable "nics" {

  type = map(object({

    nic_name            = string
    resource_group_name = string
    vnet_name           = string
    subnet_name         = string
    public_ip_name      = string

  }))

}