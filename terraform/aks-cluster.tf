# Generate random resource group name
 #resource "random_pet" "rg_name" {
  # prefix = "rg"
 #}

 #resource "random_pet" "azurerm_kubernetes_cluster_name" {
  # prefix = "cluster"
 #}

 #resource "random_pet" "azurerm_kubernetes_cluster_dns_prefix" {
  # prefix = "dns"
 #}

resource "azurerm_kubernetes_cluster" "k8s" {
  location            = azurerm_resource_group.rg.location
  name                = "cluster"
  resource_group_name = azurerm_resource_group.rg.name
  #dns_prefix          = random_pet.azurerm_kubernetes_cluster_dns_prefix.id
  dns_prefix          = "dns"

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name       = "agentpool"
    vm_size    = "Standard_D11_v2"
    node_count = 1
  }
  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
    }
  }
  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }
}
