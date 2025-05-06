resource "azurerm_resource_group" "rg" {

  name     = join("-", [var.product, var.env, "rg"])
  location = var.location
  tags     = module.tags.common_tags
}
