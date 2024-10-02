provider "azurerm" {
  
  subscription_id = "e8f0f59e-efce-4220-b59e-961cbdc607fc"
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}
