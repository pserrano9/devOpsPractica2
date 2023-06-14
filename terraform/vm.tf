# Creamos una maquina Virtual
resource "azurerm_linux_virtual_machine" "myVM1" {
    name                = "my-first-azure-vm"
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
    size                = "Standard_D1_v2"
    admin_username      = "adminUsername"
    admin_password      = "P@SSw0rd1234!"
    network_interface_ids = [ azurerm_network_interface.myNic1.id ]
    #disable_password_authentication = false
    disable_password_authentication = true
   
    admin_ssh_key {
        username = "adminUsername"
        public_key = file("~/.ssh/id_rsa.pub")
        #public_key = tls_private_key.example_ssh.public_key_openssh 
    }

    os_disk {
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    plan {
        name      = "centos-8-stream-free"
        product   = "centos-8-stream-free"
        publisher = "cognosys"
    }

    source_image_reference {
        publisher = "cognosys"
        offer     = "centos-8-stream-free"
        sku       = "centos-8-stream-free"
        version   = "22.03.28"
    }

    boot_diagnostics {
        storage_account_uri = azurerm_storage_account.stAccount.primary_blob_endpoint
    }
}
