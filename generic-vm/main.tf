resource "azurerm_linux_virtual_machine" "generic" {
  name                  = "${var.prefix}-vm"
  location              = var.location
  resource_group_name   = var.resource_group
  network_interface_ids = [var.network_interface_id]
  size                  = "Standard_B1ls"
  admin_username        = var.vm_admin_user

  source_image_reference {
    publisher = "Canonical"
    sku       = "22_04-lts-gen2"
    offer     = "0001-com-ubuntu-server-jammy"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  admin_ssh_key {
    public_key = file("${var.private_ssh_key}.pub")
    username   = var.vm_admin_user
  }
}

