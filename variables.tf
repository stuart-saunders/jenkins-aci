variable "resource_group_name" {
  type = string
  description = "The name of the Resource Group in which to place the resources"
  default = "aci-rg"
}

variable "resource_group_location" {
  type = string
  description = "The Azure region in which the Resource Group should be created"
  default = "uksouth"
}