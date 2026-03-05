# modules/networking/vnet.tf
resource "azurerm_virtual_network" "this" {
  name                = "${var.project_name}-${var.environment}-vnet"
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = var.address_space

  tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}