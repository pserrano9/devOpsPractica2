# Configuramos el conector con Azure
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=2.46.1"
     }
  }
}

# Creamos un grupo de recursos
resource "azurerm_resource_group" "rg"{
  name = "kubernetes_rg"
  location = var.location
  }
  
# Creamos una cuenta de storage
resource "azurerm_storage_account" "stAccount"{
  name = "staccountcp2"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  account_tier = "Standard"
  account_replication_type = "LRS"
  }

# Creamos un Azure Container Registry
resource "azurerm_container_registry" "acr" {
  name = "acr_devops"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  sku = "Basic"
  admin_enabled = true
}

