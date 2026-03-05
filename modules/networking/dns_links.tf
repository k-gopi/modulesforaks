############################################
# Private DNS Zone Virtual Network Link
############################################
resource "azurerm_private_dns_zone_virtual_network_link" "links" {
  for_each = azurerm_private_dns_zone.this

  name                  = "${each.key}-link"
  resource_group_name   = var.rg_name
  private_dns_zone_name = each.value.name
  virtual_network_id    = azurerm_virtual_network.this.id
  registration_enabled  = false
}