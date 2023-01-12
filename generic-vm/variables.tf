variable "location" {
  description = "The Azure location"
  type        = string
}

variable "prefix" {
  description = "A prefix to add to the resources names"
  type        = string
}

variable "private_ssh_key" {
  type        = string
  description = "The path to the public SSH key to associate with the VM"
}

variable "vm_admin_user" {
  type        = string
  description = "The name of the administrator user in the VM"
}

variable "resource_group" {
  type        = string
  description = "The resource group name to associate with"
}

variable "network_interface_id" {
  type        = string
  description = "A single network interface to associate with the VM"
}
