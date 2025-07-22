terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.78.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstateprod001danugo"
    container_name       = "tfstate"
    key                  = "epic-ire.terraform.tfstate"
  }
}

# provider "azurerm" {
#   features {}
#   skip_provider_registration = true
# }