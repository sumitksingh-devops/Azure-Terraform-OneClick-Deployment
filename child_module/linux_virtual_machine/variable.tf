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

