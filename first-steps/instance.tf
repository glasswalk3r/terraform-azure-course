resource "azurerm_network_interface" "demo-instance" {
  name                = "${var.prefix}-instance1"
  location            = var.location
  resource_group_name = azurerm_resource_group.demo.name

  ip_configuration {
    name                          = "instance1"
    subnet_id                     = azurerm_subnet.demo-internal-1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.demo-instance.id
  }
}

module "generic_vm" {
  source               = "../generic-vm"
  vm_admin_user        = var.vm_admin_user
  resource_group       = azurerm_resource_group.demo.name
  private_ssh_key      = "${path.cwd}/${var.private_ssh_key}"
  prefix               = var.prefix
  network_interface_id = azurerm_network_interface.demo-instance.id
  location             = var.location
}

resource "azurerm_network_interface_security_group_association" "allow-ssh" {
  network_interface_id      = azurerm_network_interface.demo-instance.id
  network_security_group_id = module.allow-ssh.sec_group_id
}

resource "azurerm_public_ip" "demo-instance" {
  name                = "instance1-public-ip"
  location            = var.location
  resource_group_name = azurerm_resource_group.demo.name
  allocation_method   = "Dynamic"
}
