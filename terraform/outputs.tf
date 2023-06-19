# Mostramos el nombre del grupo de recursos que hemos creado
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "acr_admin_user" {
  value     = azurerm_container_registry.acr.admin_username
  sensitive = true
}

output "acr_admin_pass" {
  value     = azurerm_container_registry.acr.admin_password
  sensitive = true
}

# Mostramos la Ip Publica creada para conectarnos a la Maquina virtual
#output "public_ip_address" {
 # value = azurerm_public_ip.myPublicIp1.id
#}

# Mostramos la key del admin
 #output "tls_private_key" {
 #  value     = tls_private_key.example_ssh.public_key_openssh
 #}
