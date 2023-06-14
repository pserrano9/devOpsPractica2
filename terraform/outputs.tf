# Mostramos el nombre del grupo de recursos que hemos creado
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

# Mostramos la Ip Publica creada para conectarnos a la Maquina virtual
output "public_ip_address" {
  value = azurerm_linux_virtual_machine.my_terraform_vm.public_ip_address
}

# Mostramos la key del admin
output "tls_private_key" {
  value     = tls_private_key.example_ssh.private_key_pem
  sensitive = true
}
