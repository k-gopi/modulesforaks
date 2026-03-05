resource "azurerm_private_dns_zone" "zones" {
  for_each = { for z in var.private_dns_zones : z.name => z }
  name                = each.value.name
  resource_group_name = var.rg_name
}