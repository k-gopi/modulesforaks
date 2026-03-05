# modules/networking/outputs.tf
output "vnet_id" {
  value = azurerm_virtual_network.this.id
}

output "subnet_ids" {
  value = { for s in azurerm_subnet.this : s.name => s.id }
}

output "private_dns_zone_ids" {
  value = [for pdz in azurerm_private_dns_zone.this : pdz.id]
}

output "private_dns_zone_names" {
  value = [for pdz in azurerm_private_dns_zone.this : pdz.name]
}

output "route_table_ids" {
  value = { for rt in azurerm_route_table.this : rt.name => rt.id }
}