resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_container_group" "controller" {
  name                = "jenkins-controller"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  ip_address_type     = "Public"
  dns_name_label      = var.controller_dns_name_label
  os_type             = "Linux"

  container {
    name   = "jenkins"
    image  = "jenkins/jenkins:lts"
    cpu    = "1"
    memory = "1.5"

    ports {
      port     = 8080
      protocol = "TCP"
    }

    ports {
      port     = 50000
      protocol = "TCP"
    }

    volume {
      name       = "jenkins-controller-home"
      mount_path = "/var/jenkins_home"

      storage_account_name = azurerm_storage_account.this.name
      storage_account_key  = azurerm_storage_account.this.primary_access_key
      share_name           = azurerm_storage_share.controller.name
    }
  }
}

resource "azurerm_container_group" "node" {
  name                = "jenkins-node"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  ip_address_type     = "Public"
  dns_name_label      = var.node_dns_name_label
  os_type             = "Linux"

  container {
    name   = "jenkins"
    image  = "jenkins/jenkins:lts"
    cpu    = "1"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }

    volume {
      name       = "jenkins-node-home"
      mount_path = "/var/jenkins_home"

      storage_account_name = azurerm_storage_account.this.name
      storage_account_key  = azurerm_storage_account.this.primary_access_key
      share_name           = azurerm_storage_share.node.name
    }
  }
}