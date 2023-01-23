resource "azurerm_storage_account" "this" {
  name                     = "ss3jenkinsaci${formatdate("DDMMhhmm", timestamp())}"
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_share" "this" {
  name                 = "jenkins"
  storage_account_name = azurerm_storage_account.this.name
  quota                = 10
}