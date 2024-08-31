# Optionally, define backend settings for storing Terraform state remotely.
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.116.0"
    }
  }
}
