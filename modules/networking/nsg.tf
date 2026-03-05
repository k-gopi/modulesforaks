resource "azurerm_network_security_group" "nsg" {
  name                = "${var.project_name}-${var.environment}-nsg"
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_subnet_network_security_group_association" "subnet_nsg" {
  for_each                 = azurerm_subnet.subnets
  subnet_id                 = each.value.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}