provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "tfstate" {
  name     = "tfstate-rg"
  location = "centralus"
}

resource "azurerm_storage_account" "tfstate" {
  name                     = "tfstateprod001danugo"  # Must be globally unique
  resource_group_name      = azurerm_resource_group.tfstate.name
  location                 = azurerm_resource_group.tfstate.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  enable_https_traffic_only = true
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"
}
