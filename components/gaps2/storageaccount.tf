module "storage_account" {
  source = "github.com/hmcts/cnp-module-storage-account?ref=4.x"

  env                      = var.env
  storage_account_name     = "hmcts${var.product}${var.env}sftp"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  enable_hns  = true
  enable_sftp = true

  common_tags = module.tags.common_tags
}

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
