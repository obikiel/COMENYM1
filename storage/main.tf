resource "azurerm_resource_group" "comenym1-rg" {
  name     = "comenym1-resources"
  location = "West Europe"
  tags = {
    environment = "dev"
  }
}


resource "azurerm_storage_account" "comenym1-storage" {
  name                     = "comenym1storage"
  resource_group_name      = azurerm_resource_group.comenym1.name
  location                 = azurerm_resource_group.comenym1.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "dev"
  }
}