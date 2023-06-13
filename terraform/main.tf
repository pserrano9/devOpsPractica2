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

