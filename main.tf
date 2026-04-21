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

resource "azurerm_resource_group" "demo_recurso" {
location = "mexicocentral"
name = var.demo_recurso_nombre
}


