data "azurerm_subscription" "current" {}
data "azurerm_client_config" "current" {}

data "azurerm_virtual_network" "jumpbox_vnet" {
  provider = azurerm.vnet

  resource_group_name = var.virtual_network.resource_group_name
  name                = var.virtual_network.virtual_network_name
}

module "tags" {
  source = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"

  environment = var.env
  product     = var.product
  builtFrom   = var.builtFrom
}
