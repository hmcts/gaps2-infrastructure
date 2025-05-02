resource "azurerm_subnet" "gaps2" {

  name                 = "gaps2-subnet"
  resource_group_name  = var.virtual_network.resource_group_name
  virtual_network_name = var.virtual_network.virtual_network_name
  address_prefixes     = [var.gaps2_subnet_range]
  service_endpoints    = ["storage"]

}
