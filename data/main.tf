data "azurerm_resource_group" "imported_rg" {
  name = "grupo_previo"  
}

# manejar o crear recursos adicionales dentro de un grupo de recursos previamente creado
/*
data "recurso_que_ocuparé" "nombre_que_le_daré_al_bloque" {
  name = "grupo_previo"  
}
*/

resource "azurerm_storage_account" "storageeduardo" {
  location = data.azurerm_resource_group.imported_rg.location
  name                     = "edualmacenamientoprevio"
  resource_group_name      = data.azurerm_resource_group.imported_rg.name
  account_tier             = "Standard"
  account_replication_type = "GRS"
  public_network_access_enabled = false
  tags = {
    environment = "staging"
  }
}
