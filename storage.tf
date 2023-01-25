resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_share" "controller" {
  name                 = "jenkins-controller"
  storage_account_name = azurerm_storage_account.this.name
  quota                = 50
}

resource "azurerm_storage_share" "node" {
  name                 = "jenkins-node"
  storage_account_name = azurerm_storage_account.this.name
  quota                = 50
}