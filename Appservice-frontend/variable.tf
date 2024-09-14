variable "resource_group_name" {
    description = "Name of the resource group"
    type        = string
    default     = "comenym1rg"
}

variable "location" {
    description = "Azure region where resources will be created"
    type        = string
    default     = "West Europe"
}

variable "app_service_plan_name" {
    description = "Name of the App Service Plan"
    type        = string
    default     = "comenym1plan"
}

variable "app_service_name" {
    description = "Name of the App Service"
    type        = string
    default     = "comenym1frontend"
}

variable "sku_name" {
    description = "SKU Name for the App Service Plan"
    type        = string
    default     = "S1"  # Example: Use "B1" or other valid options
}
