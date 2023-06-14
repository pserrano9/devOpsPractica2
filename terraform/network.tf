# Creamos la red Virtual
resource "azurerm_virtual_network" "myNet" {
  name = "kubernetesnet"
  address_space = ["10.0.0.0/16"]
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Creamos una subnet
resource "azurerm_subnet" "mySubnet" {
  name = "terraformsubnet"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.myNet.name
  address_prefixez = ["10.0.1.0/24"]
}

# Creamos una Interfaz de Red
resource "azurerm_network_interface" "myNicl" {
  name = "vmnicl"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  
    ip_configuration {
      name = "myipconfiguration1"
      subnet_id = azurerm_subnet.mySubnet.id
      private_ip_addess_allocation = "Static"
      private_ip_addess = "10.0.1.10"
      public_ip_addess_id = azurerm_public_ip.myPublicIp1.id
    }
}

# Creamos una IP Publica
resource "azurerm_public_ip" "myPublicIp1" {
  name = "vmip1"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method = "Dynamic"
  sku = "Basic"
}
