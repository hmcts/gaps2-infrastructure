
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
