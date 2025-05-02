module "key_vault" {
  source = "github.com/hmcts/cnp-module-key-vault?ref=master"

  name                = "${var.product}-kv-${var.env}"
  resource_group_name = azurerm_resource_group.rg.name
  product             = var.product
  env                 = var.env
  common_tags         = module.tags.common_tags
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
