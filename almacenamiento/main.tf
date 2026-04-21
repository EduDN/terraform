terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.69.0"
    }
  }
}

provider "azurerm" {
  features {
  }
  subscription_id =  var.subscripcion
}

resource "azurerm_resource_group" "almacenamiento" {
  name     = "edu_almacenamiento"
  location = "eastus"
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "testedualmacenamiento"
  resource_group_name      = azurerm_resource_group.almacenamiento.name
  location                 = azurerm_resource_group.almacenamiento.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  public_network_access_enabled = false
  tags = {
    environment = "staging"
  }
}