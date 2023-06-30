# Mostramos el nombre del grupo de recursos que hemos creado
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

# IP Publica de la VM
output "VM-IP" {
     description = "The VM Public IP is:"
     value = azurerm_public_ip.vm1publicip.ip_address
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

#output "kubernetes_cluster_name" {
#  value = azurerm_kubernetes_cluster.k8s.name
#}

#output "client_certificate" {
 # value     = azurerm_kubernetes_cluster.k8s.kube_config[0].client_certificate
 # sensitive = true
#}

#output "client_key" {
 # value     = azurerm_kubernetes_cluster.k8s.kube_config[0].client_key
 # sensitive = true
#}

#output "cluster_ca_certificate" {
 # value     = azurerm_kubernetes_cluster.k8s.kube_config[0].cluster_ca_certificate
  #sensitive = true
#}

#output "cluster_password" {
#  value     = azurerm_kubernetes_cluster.k8s.kube_config[0].password
 # sensitive = true
#}

#output "cluster_username" {
#  value     = azurerm_kubernetes_cluster.k8s.kube_config[0].username
 # sensitive = true
#}

#output "host" {
 # value     = azurerm_kubernetes_cluster.k8s.kube_config[0].host
#  sensitive = true
#}

#output "kube_config" {
#  value     = azurerm_kubernetes_cluster.k8s.kube_config_raw
#  sensitive = true
#}
