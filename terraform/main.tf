# Configuramos el conector con Azure
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=2.46.1"
     }
  }
}

# Creamos el Servicio Principal e indicamos los datos para autentificar
provider "azurerm" {
  features {}
  subscription_id = "c60a65ff-0234-44cc-abf5-cdca6ecf27d0"
  client_id       = "995044c1-34c1-4868-9724-6ef339037471"
  client_secret   = "nzQ8Q~S4f1joQ39MCMI6mo4y1pHT53LLttIw8aVz"
  tenant_id       = "899789dc-202f-44b4-8472-a6d40f9eb440"
}

# Creamos un grupo de recursos
resource "azurerm_resource_group" "rg"{
  name = "kubernetes_rg"
  location = var.location

  #tags = {
   #envirnonment = "CP2"
  #}
  
# Creamos una cuenta de storage
resource "azurerm_storage_account" "stAccount"{
  name = "staccountcp2"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  account_tier = "Standard"
  account_replication_Type = "LRS"
  
  #tags = {
   #envirnonment = "CP2"
  #}  
}
