data "azurerm_subscription" "current" {}
data "azurerm_client_config" "current" {}

module "tags" {
  source = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"

  environment = var.env
  product     = var.product
  builtFrom   = var.builtFrom
}
