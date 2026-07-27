variable "vms" {

  type = map(object({

    vm_name             = string
    resource_group_name = string
    nic_name            = string
    vm_size             = string

  }))

}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}