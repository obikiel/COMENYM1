variable "resource_group_name" {
    description = "The name of the resource group"
    default = "comenym1"  
}

variable "location" {
    description = "The name of the resource group"
    default = "West Europe"  
}

variable "account_tier" {
    description = "The tier of the resource"
    default = "standard"  
}

variable "account_replication_type" {
    description = "zone redundancy of the resource"
    default = "GRS"  
}