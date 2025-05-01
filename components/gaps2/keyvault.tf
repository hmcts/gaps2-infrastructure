module "key_vault" {
  source = "git@github.com:hmcts/cnp-module-key-vault?ref=master"

  name                = "${var.product}-kv-${var.env}"
  resource_group_name = azurerm_resource_group.rg.name
  product             = var.product
  env                 = var.env
  common_tags         = module.tags.common_tags
}
