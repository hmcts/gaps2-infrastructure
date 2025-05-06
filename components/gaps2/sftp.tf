resource "azurerm_storage_container" "ih" {
  name                  = "ih-sftp"
  storage_account_id    = module.storage_account.storageaccount_id
  container_access_type = "private"
}

resource "azurerm_storage_account_local_user" "ihsftp" {

  name                 = "ihsftp"
  storage_account_id   = module.storage_account.storageaccount_id
  ssh_password_enabled = true
  home_directory       = "/"

  permission_scope {
    permissions {
      read   = true
      list   = true
      create = true
    }
    service       = "blob"
    resource_name = azurerm_storage_container.ih.name
  }

  depends_on = [
    module.key_vault
  ]
}
