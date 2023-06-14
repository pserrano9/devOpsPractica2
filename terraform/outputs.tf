# Mostramos el nombre del grupo de recursos que hemos creado
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

# Mostramos la Ip Publica creada para conectarnos a la Maquina virtual
output "public_ip_address" {
  value = azurerm_public_ip.myPublicIp1.id
}

# Mostramos la key del admin
output "tls_private_key" {
  value     = tls_private_key.sshKey.public_key_openssh
  sensitive = true
}
