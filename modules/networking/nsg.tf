# modules/networking/nsg.tf
resource "azurerm_network_security_group" "this" {
  name                = "${var.project_name}-${var.environment}-nsg"
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_subnet_network_security_group_association" "this" {
  for_each = azurerm_subnet.this

  subnet_id                 = each.value.id
  network_security_group_id = azurerm_network_security_group.this.id
}