resource "azurerm_virtual_network" "this" {
  name                = "${var.project_name}-${var.environment}-${var.vnet_name_suffix}"
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = var.address_space
}