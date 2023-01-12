variable "resource_group" {
  type        = string
  description = "The resource group name to associate the resources with"
}

variable "prefix" {
  type        = string
  description = "The prefix to add to the resource names"
}

variable "location" {
  type        = string
  description = "The Azure location to create the resource"
}
