resource "azurerm_resource_group" "COMENYM" {
    name     = var.resource_group_name
    location = var.location
}

resource "azurerm_service_plan" "COMENYM" {
    name                = var.app_service_plan_name
    location            = azurerm_resource_group.COMENYM.location
    resource_group_name = azurerm_resource_group.COMENYM.name
    os_type             = "Windows"  # or "Linux" depending on your app
    sku_name            = var.sku_name   
}

resource "azurerm_windows_web_app" "COMENYM" {
    name                = var.app_service_name
    location            = azurerm_resource_group.COMENYM.location
    resource_group_name = azurerm_resource_group.COMENYM.name
    service_plan_id = azurerm_service_plan.COMENYM.id
    site_config {
        # linux_fx_version = "NODE|18-lts" # You can adjust this based on your React app requirements
    }

    app_settings = {
        "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    }
}

output "app_service_default_site" {
    description = "The default URL for the app service"
    value       = azurerm_windows_web_app.COMENYM.default_hostname
}
