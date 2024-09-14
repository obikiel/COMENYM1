variable "resource_group_name" {
    description = "The name of the resource group"
    default     = "comenym1rg"
}

variable "location" {
    description = "The location of the resource group"
    default     = "West Europe"
}

variable "admin_login" {
    description = "Administrator login name for SQL server"
    default     = "comenymsqladmin"
}

variable "sql_database_name" {
    description = "The name of the database"
    default = "comenym1sql"  
}

variable "sql_server_name" {
    description = "The name of the database"
    default = "comenym1sqlserver"  
}