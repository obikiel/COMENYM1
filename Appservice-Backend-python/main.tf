# configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.0"
    }
  }
}

provider "azurerm" {
  features {

  }
}

# create the resource group
resource "azurerm_resource_group" "app_service" {
  name     = "comenym1rg"
  location = "West Europe"
}

# create the Linux App Service plan
resource "azurerm_service_plan" "app_service" {
  name                = "comenym1plan"
  resource_group_name = azurerm_resource_group.app_service.name
  location            = azurerm_resource_group.app_service.location
  sku_name            = "P1v2"
  os_type             = "Linux"
}

# create the linux web app and confgure app stack
resource "azurerm_linux_web_app" "app_service" {
  name                = "comenym1backend"
  resource_group_name = azurerm_resource_group.app_service.name
  location            = azurerm_service_plan.app_service.location
  service_plan_id     = azurerm_service_plan.app_service.id

  site_config {
    minimum_tls_version = "1.2"
    application_stack {
      python_version = "3.12"
    }
  }
}
