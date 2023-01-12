resource "azurerm_virtual_network" "demo" {
  name                = "${var.prefix}-network"
  location            = var.location
  resource_group_name = azurerm_resource_group.demo.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "demo-internal-1" {
  name                 = "${var.prefix}-internal-1"
  resource_group_name  = azurerm_resource_group.demo.name
  virtual_network_name = azurerm_virtual_network.demo.name
  address_prefixes     = ["10.0.0.0/24"]
}

module "allow-ssh" {
  resource_group = azurerm_resource_group.demo.name
  location       = var.location
  prefix         = var.prefix

  source = "../allow-ssh"
  depends_on = [
    azurerm_network_interface.demo-instance
  ]
}

