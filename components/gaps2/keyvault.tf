module "key_vault" {
  source = "github.com/hmcts/cnp-module-key-vault?ref=master"

  name                = "${var.product}-kv-${var.env}"
  resource_group_name = azurerm_resource_group.rg.name
  product             = var.product
  env                 = var.env
  object_id           = data.azurerm_client_config.current.object_id
  product_group_name  = "GAPS2 Reporting"

  common_tags = module.tags.common_tags
}

# Custom policy for team user using objectId of Entra user
resource "azurerm_key_vault_access_policy" "custom" {
  key_vault_id = module.key_vault.key_vault_id
  object_id    = "cc2d6a5d-5e54-4d39-ba3a-01fc0da9545c"
  tenant_id    = data.azurerm_client_config.current.tenant_id

  secret_permissions = [
    "Get",
    "List",
  ]
}


resource "azurerm_key_vault_secret" "ih_sftp_password" {

  name         = "ih-sftp-password"
  value        = azurerm_storage_account_local_user.ihsftp.password
  key_vault_id = module.key_vault.key_vault_id

  depends_on = [
    module.key_vault,
    azurerm_storage_account_local_user.ihsftp
  ]

}
