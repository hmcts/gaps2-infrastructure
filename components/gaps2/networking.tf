resource "azurerm_subnet" "gaps2" {
  provider = azurerm.vnet

  name                 = "gaps2-subnet"
  resource_group_name  = data.virtual_network.jumpbox_vnet.resource_group_name
  virtual_network_name = data.virtual_network.jumpbox_vnet.name
  address_prefixes     = [var.gaps2_subnet_range]
  service_endpoints    = ["storage"]

}
