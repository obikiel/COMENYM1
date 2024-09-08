# create the resource group
resource "azurerm_resource_group" "app_service" {
  name     = var.rg
  location = var.location
}

# create the Linux App Service plan
resource "azurerm_service_plan" "app_service" {
  name                = var.app_service_plan
  resource_group_name = var.rg
  location            = var.location
  sku_name            = "S2"
  os_type             = "Linux"
}

# create the linux web app and confgure app stack
resource "azurerm_linux_web_app" "app_service" {
  name                = var.linux_app_service
  resource_group_name = var.rg
  location            = var.location
  service_plan_id     = azurerm_service_plan.app_service.id

  site_config {
    minimum_tls_version = "1.2"
    application_stack {
      python_version = "3.12"
    }
  }
}
