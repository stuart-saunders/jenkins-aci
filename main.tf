resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_container_group" "this" {
  name                = "jenkins"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  ip_address_type     = "Public"
  dns_name_label      = "ssaunders3-jenkins"
  os_type             = "Linux"

  container {
    name   = "jenkins"
    image  = "jenkins/jenkins:lts"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 8080
      protocol = "TCP"
    }

    volume {
      name = "jenkins-volume"
      mount_path = "/var/jenkins/home"

      storage_account_name = azurerm_storage_account.this.name
      storage_account_key = azurerm_storage_account.this.primary_access_key
      share_name = azurerm_storage_share.this.name
    }
  }

  tags = {
    environment = "testing"
  }
}