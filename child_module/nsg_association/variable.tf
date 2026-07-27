variable "associations" {

  type = map(object({

    nic_name            = string
    nsg_name            = string
    resource_group_name = string

  }))

}