resource "azurerm_resource_group" "comenym" {
    name     = var.resource_group_name
    location = var.location
}

resource "azurerm_mssql_server" "sqlserver" {
    name                         = var.sql_server_name
    resource_group_name          = azurerm_resource_group.comenym.name      # Reference to resource group name
    location                     = azurerm_resource_group.comenym.location  # Reference to resource group location
    version                      = "12.0"
    administrator_login          = "4dm1n157r470r"
    administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

resource "azurerm_mssql_database" "sqlDB" {
    name         = var.sql_database_name
    server_id    = azurerm_mssql_server.sqlserver.id
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb  = 2
    sku_name     = "S0"
    enclave_type = "VBS"

    tags = {
        foo = "bar"
    }

    # prevent the possibility of accidental data loss
    lifecycle {
        prevent_destroy = true
    }
}




# resource "azurerm_resource_group" "ENOCHRG" {
#     name     = var.resource_group_name
#     location = var.location
# }

# resource "azurerm_mssql_server" "ENOCHSERVER" {
#     name                         = "yomist-sqlserver"
#     resource_group_name          = azurerm_resource_group.name
#     location                     = azurerm_resource_group.location
#     version                      = "12.0"
#     administrator_login          = var.admin_login
#     administrator_login_password = random_password.password.result
#     connection_policy            = "Default"
# }

# resource "random_password" "password" {
#     length  = 16
#     special = true
# }

# # resource "azurerm_mssql_database" "ENOCHDB" {
# #     name                            = "yomist-database"
# #     resource_group_name             = azurerm_resource_group.comenym.name
# #     location                        = azurerm_resource_group.comenym.location
# #     server_name                     = azurerm_sql_server.comenym.name
# #     collation                       = "SQL_Latin1_General_CP1_CI_AS"
    
# #     edition                         = "GeneralPurpose"
# #     max_size_gb                     = 2
# #     requested_service_objective_name = "GP_Gen5_2"
# # }

# # MSSQL Database
# resource "azurerm_mssql_database" "ENOCHDB" {
#     name                = "yomist-database"
#     server_id           = azurerm_mssql_server.comenym.id
#     collation           = "SQL_Latin1_General_CP1_CI_AS"
#     max_size_gb         = 10
#     sku_name            = "GP_Gen5_2"
# }

# output "sql_server_name" {
#     value = azurerm_sql_server.comenym.name
# }

# output "sql_database_name" {
#     value = azurerm_sql_database.comenym.name
# }

# output "admin_password" {
#     value     = random_password.password.result
#     sensitive = true
# }

