# Creamos nuestro AKS
resource "azurerm_kubernetes_cluster" "k8s" {
 location            = azurerm_resource_group.rg.location
 name                = "cluster"
 resource_group_name = azurerm_resource_group.rg.name
 dns_prefix          = "dns"

 identity {
    type = "SystemAssigned"
 }

 default_node_pool {
    name       = "agentpool"
    vm_size    = "Standard_D11_v2"
    node_count = 1
  }
 
network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }
}

 # Conectar ACR con AKS
  resource "azurerm_role_assignment" "example" {
   scope                            = azurerm_container_registry.acr.id
   role_definition_name             = "AcrPull"
   principal_id                     = azurerm_kubernetes_cluster.k8s.kubelet_identity[0].object_id
   skip_service_principal_aad_check = true
}

#resource "azurerm_user_assigned_identity" "aks" {
#  location            = azurerm_resource_group.rg.location
#  name                = "aksIdentity"
#  resource_group_name = azurerm_resource_group.rg.name
#}

#resource "azurerm_role_assignment" "aks_network" {
 # scope                = azurerm_resource_group.rg.id
#  role_definition_name = "Network Contributor"
#  principal_id         = azurerm_user_assigned_identity.aks.principal_id
#}

#resource "azurerm_role_assignment" "aks_acr" {
 # scope                = azurerm_container_registry.acr.id
 # role_definition_name = "AcrPull"
 # principal_id         = azurerm_user_assigned_identity.aks.principal_id
#}


