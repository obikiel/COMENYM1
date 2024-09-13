# create the resource group
resource "azurerm_resource_group" "resource_group_name" {
    name     = var.resource_group_name
    location = var.location
}

resource "azurerm_virtual_network" "my_vnet" {
    name                = var.vnet_name
    location            = var.location
    resource_group_name = var.resource_group_name
    address_space       = [var.vnet_address_space]
}

# Subnets
resource "azurerm_subnet" "web_subnet" {
    name                 = var.web_subnet_name
    resource_group_name  = var.resource_group_name
    virtual_network_name = azurerm_virtual_network.my_vnet.name
    address_prefixes     = [var.web_subnet_prefix]
}

resource "azurerm_subnet" "app_subnet" {
    name                 = var.app_subnet_name
    resource_group_name  = var.resource_group_name
    virtual_network_name = azurerm_virtual_network.my_vnet.name
    address_prefixes     = [var.app_subnet_prefix]
}

resource "azurerm_subnet" "db_subnet" {
    name                 = var.db_subnet_name
    resource_group_name  = var.resource_group_name
    virtual_network_name = azurerm_virtual_network.my_vnet.name
    address_prefixes     = [var.db_subnet_prefix]
}

# Network Security Groups (NSGs)
resource "azurerm_network_security_group" "web_nsg" {
    name                = "web-nsg"
    location            = var.location
    resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_group" "app_nsg" {
    name                = "app-nsg"
    location            = var.location
    resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_group" "db_nsg" {
    name                = "db-nsg"
    location            = var.location
    resource_group_name = var.resource_group_name
}

# Associate NSGs with Subnets
resource "azurerm_subnet_network_security_group_association" "web_subnet_nsg" {
    subnet_id                 = azurerm_subnet.web_subnet.id
    network_security_group_id = azurerm_network_security_group.web_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "app_subnet_nsg" {
    subnet_id                 = azurerm_subnet.app_subnet.id
    network_security_group_id = azurerm_network_security_group.app_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "db_subnet_nsg" {
    subnet_id                 = azurerm_subnet.db_subnet.id
    network_security_group_id = azurerm_network_security_group.db_nsg.id
}

