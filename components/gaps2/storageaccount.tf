module "storage_account" {
  source = "github.com:hmcts/cnp-module-storage-account?ref=4.x"

  env                      = var.env
  storage_account_name     = "${var.product}${var.env}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  role_assignments = [
    "Storage Blob Data Contributor"
  ]
}
