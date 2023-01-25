terraform {
  backend "azurerm" {
    resource_group_name  = "default-rg"
    storage_account_name = "<storage_account_name>" 
    container_name       = "tfstate"
    key                  = "jenkins.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.30"
    }
  }
}