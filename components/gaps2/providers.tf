
terraform {
  required_version = "1.11.4"

  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.27.0"
    }
  }
}
provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
}

provider "azurerm" {
  alias                           = "vnet"
  resource_provider_registrations = "none"
  subscription_id                 = local.subscriptions[local.vnet_subscription].subscription
  features {}
}

provider "azurerm" {
  alias                           = "privatelinkdns"
  resource_provider_registrations = "none"
  subscription_id                 = "1baf5470-1c3e-40d3-a6f7-74bfbce4b348"
  features {}
}
