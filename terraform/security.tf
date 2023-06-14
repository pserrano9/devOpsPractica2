# Creamos un Security Group
resource "azurerm_network_security_group" "mySecGroup" {
  name = "sshtrafic"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  
  security_rule {
    name = "SSH"
    priority = 1001
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "22"
    source_address_prefix = "*"
    destination_address_prefix = "*"
  }
}

# Vinculamos el Security Group con la interfaz de red
resource "azurerm_network_interface_security_group_association" "mySecGroupAssociation1" {
  network_interface_id = azurerm_network_interface_myNic1.id
  network_security_group_id = azurerm_network_security_group.mySecGroup.id
}
  
