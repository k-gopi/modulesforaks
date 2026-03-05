# modules/networking/private_dns_zone.tf
resource "azurerm_private_dns_zone" "this" {
  for_each = { for pdz in var.private_dns_zones : pdz.name => pdz }
  name                = each.value.name
  resource_group_name = var.rg_name
}