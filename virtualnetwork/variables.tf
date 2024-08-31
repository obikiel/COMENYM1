variable "vnet_name" {
  description = "Name of the Virtual Network"
  default     = "comenym1vnet"
}

variable "location" {
  description = "Azure location"
  default     = "West Europe"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  default = "comenym1rg"
}

variable "vnet_address_space" {
  description = "Address space for the Virtual Network"
  default     = "10.0.0.0/16"
}

variable "web_subnet_name" {
  description = "Name of the Web Subnet"
  default     = "web-subnet"
}

variable "web_subnet_prefix" {
  description = "Address prefix for the Web Subnet"
  default     = "10.0.1.0/24"
}

variable "app_subnet_name" {
  description = "Name of the Application Subnet"
  default     = "app-subnet"
}

variable "app_subnet_prefix" {
  description = "Address prefix for the Application Subnet"
  default     = "10.0.2.0/24"
}

variable "db_subnet_name" {
  description = "Name of the Database Subnet"
  default     = "db-subnet"
}

variable "db_subnet_prefix" {
  description = "Address prefix for the Database Subnet"
  default     = "10.0.3.0/24"
}

