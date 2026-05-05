terraform {
  backend "azurerm" {
    storage_account_name = "terraformstatesedu"
    container_name = "states"
    key = "estados.tfstate"
  }
}