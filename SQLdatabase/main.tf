resource "azurerm_resource_group" "ENOCHRG" {
    name     = var.resource_group_name
    location = var.location
}

resource "azurerm_sql_server" "ENOCHSERVER" {
    name                         = "yomist-sqlserver"
    resource_group_name          = azurerm_resource_group.example.name
    location                     = azurerm_resource_group.example.location
    version                      = "12.0"
    administrator_login          = var.admin_login
    administrator_login_password = random_password.password.result
    connection_policy            = "Default"
}

resource "random_password" "password" {
    length  = 16
    special = true
}

resource "azurerm_sql_database" "ENOCHDB" {
    name                = "yomist-database"
    resource_group_name = azurerm_resource_group.example.name
    location            = azurerm_resource_group.example.location
    server_name         = azurerm_sql_server.example.name
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    
    edition                     = "GeneralPurpose"
    max_size_gb                 = 2
    requested_service_objective_name = "GP_Gen5_2"
}

output "sql_server_name" {
    value = azurerm_sql_server.example.name
}

output "sql_database_name" {
    value = azurerm_sql_database.example.name
}

output "admin_password" {
    value     = random_password.password.result
    sensitive = true
}

