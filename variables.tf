variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group in which to place the resources"
  default     = "jenkins-rg"
}

variable "resource_group_location" {
  type        = string
  description = "The Azure region in which the Resource Group should be created"
  default     = "uksouth"
}

variable "dns_name_label" {
  type        = string
  description = "The DNS name of the Container Group's IP address"
}

variable "storage_account_name" {
  type        = string
  description = "The name of the Storage Account to create to store the Container Group's volume"
}