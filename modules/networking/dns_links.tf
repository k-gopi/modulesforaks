resource "azurerm_private_dns_zone_virtual_network_link" "links" {
  for_each = { for z in var.private_dns_zones : z.name => z }
  name                  = "${each.key}-link"
  resource_group_name   = var.rg_name
  private_dns_zone_name = azurerm_private_dns_zone.zones[each.key].name
  virtual_network_id    = azurerm_virtual_network.this.id
  registration_enabled  = false
}