module "storage_account" {
  source = "github.com/hmcts/cnp-module-storage-account?ref=fix/private-endpoint-provider-4.x"

  env                      = var.env
  storage_account_name     = "hmcts${var.product}${var.env}sftp"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  enable_hns  = true
  enable_sftp = true

  private_endpoint_subnet_id       = azurerm_subnet.gaps2.id
  private_endpoint_rg_name         = local.subscriptions[local.vnet_subscription].resource_group
  private_endpoint_subscription_id = local.subscriptions[local.vnet_subscription].subscription

  sa_subnets = [
    azurerm_subnet.gaps2.id
  ]

  common_tags = module.tags.common_tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "jumpbox" {
  provider = azurerm.privatelinkdns

  name                  = "jumpbox-${var.env}-vnet"
  resource_group_name   = "core-infra-intsvc-rg"
  private_dns_zone_name = "privatelink.blob.core.windows.net"
  virtual_network_id    = data.azurerm_virtual_network.jumpbox_vnet.id
}

